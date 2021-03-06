import 'package:clone_olx/screens/category/category_screen.dart';
import 'package:clone_olx/stores/announcement_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CategoryField extends StatelessWidget {
  const CategoryField({
    Key? key,
    required this.announcementStore,
  }) : super(key: key);

  final AnnouncementStore announcementStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          ListTile(
            title: Text(
              'Categoria *',
              style: TextStyle(
                fontWeight: announcementStore.category == null
                    ? FontWeight.w800
                    : FontWeight.w700,
                color: Colors.grey,
                fontSize: announcementStore.category == null ? 18 : 14,
              ),
            ),
            subtitle: announcementStore.category == null
                ? null
                : Text(announcementStore.category!.description),
            trailing: const Icon(Icons.keyboard_arrow_down),
            onTap: () async {
              final category = await showDialog(
                context: context,
                builder: (context) => CategoryScreen(
                  showAll: false,
                  selected: announcementStore.category,
                ),
              );

              if (category != null) {
                announcementStore.setCategory(category);
              }
            },
          ),
          (announcementStore.categoryError != null)
              ? Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: Text(
                    announcementStore.categoryError!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                )
              : Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
        ],
      );
    });
  }
}
