import 'package:clone_olx/components/error_box.dart';
import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/stores/category_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({
    Key? key,
    this.selected,
    this.showAll = true,
  }) : super(key: key);

  final Category? selected;
  final bool showAll;

  final CategoryStore categoryStore = GetIt.I<CategoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Observer(
            builder: (context) {
              if (categoryStore.error != null) {
                return ErrorBox(
                  message: categoryStore.error,
                );
              } else if (categoryStore.categoryList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final categories = showAll
                    ? categoryStore.allCategoryList
                    : categoryStore.categoryList;

                return ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (_, __) {
                    return const Divider(
                      height: 0.1,
                      color: Colors.grey,
                    );
                  },
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pop(category);
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        color: category.id == selected?.id
                            ? Colors.purple.withAlpha(50)
                            : null,
                        child: Text(
                          category.description,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: category.id == selected?.id
                                ? FontWeight.bold
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
