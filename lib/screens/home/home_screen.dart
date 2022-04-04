import 'package:clone_olx/components/custom_drawer/custom_drawer.dart';
import 'package:clone_olx/screens/home/components/adtile.dart';
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
          children: [
            TopBar(),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (homeStore.error != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.error,
                            size: 100,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Ocorreu um erro!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (homeStore.adList.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.border_clear,
                            size: 100,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Humm...Nenhum anúncio encontrado!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (homeStore.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListView.builder(
                        itemCount: homeStore.adList.length,
                        itemBuilder: (context, index) {
                          return AdTile(
                            ad: homeStore.adList[index],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
