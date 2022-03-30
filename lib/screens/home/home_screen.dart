import 'package:clone_olx/components/custom_drawer/custom_drawer.dart';
import 'package:clone_olx/screens/home/components/search_dialog.dart';
import 'package:clone_olx/screens/home/components/topbar.dart';
import 'package:clone_olx/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeStore homeStore = GetIt.I<HomeStore>();

  void _openSearch(BuildContext context) async {
    final searchText = await showDialog(
      context: context,
      builder: (_) => SearchDialog(
        currentSearchText: homeStore.searchText,
      ),
    );

    if (searchText != null) {
      homeStore.setSearchText(searchText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Observer(
              builder: (_) {
                if (homeStore.searchText.isEmpty) {
                  return Container();
                } else {
                  return GestureDetector(
                    onTap: () => _openSearch(context),
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        return SizedBox(
                          width: constraints.biggest.width,
                          child: Text(homeStore.searchText),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            actions: [
              Observer(
                builder: (_) {
                  if (homeStore.searchText.isEmpty) {
                    return IconButton(
                      onPressed: () {
                        _openSearch(context);
                      },
                      icon: const Icon(
                        Icons.search,
                      ),
                    );
                  } else {
                    return IconButton(
                      onPressed: () {
                        homeStore.setSearchText('');
                      },
                      icon: const Icon(
                        Icons.clear,
                      ),
                    );
                  }
                },
              )
            ],
          ),
          body: Column(
            children: const [
              TopBar(),
            ],
          )),
    );
  }
}
