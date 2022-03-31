import 'package:clone_olx/screens/category/category_screen.dart';
import 'package:clone_olx/screens/filter/filter_screen.dart';
import 'package:clone_olx/screens/home/components/buttonbar.dart';
import 'package:clone_olx/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class TopBar extends StatelessWidget {
  TopBar({Key? key}) : super(key: key);

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(
          builder: (_) {
            return ButtonBarWidget(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white),
                ),
              ),
              label: homeStore.category?.description ?? "Categorias",
              onTap: () async {
                final category = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      showAll: true,
                      selected: homeStore.category,
                    ),
                  ),
                );

                if (category != null) {
                  homeStore.setCategory(category);
                }
              },
            );
          },
        ),
        ButtonBarWidget(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white),
            ),
          ),
          label: "Filtros",
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FilterScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
