import 'package:clone_olx/components/custom_drawer/custom_drawer.dart';
import 'package:clone_olx/screens/home/components/adtile.dart';
import 'package:clone_olx/screens/home/components/create_ad_button.dart';
import 'package:clone_olx/screens/home/components/search_dialog.dart';
import 'package:clone_olx/screens/home/components/topbar.dart';
import 'package:clone_olx/screens/myads/components/empty_card.dart';
import 'package:clone_olx/stores/home_store.dart';
import 'package:clone_olx/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore homeStore = GetIt.I<HomeStore>();

  final ScrollController scrollController = ScrollController();

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
              child: Stack(
                children: [
                  Observer(
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
                        return const EmptyCard(
                            text: 'Nenhum anúncio encontrado');
                      } else if (homeStore.showProgress) {
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
                            controller: scrollController,
                            itemCount: homeStore.itemCount,
                            itemBuilder: (context, index) {
                              if (index < homeStore.adList.length) {
                                return AdTile(
                                  ad: homeStore.adList[index],
                                );
                              } else if (!homeStore.lastPage) {
                                homeStore.loadingNextPage();
                                return const LinearProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        );
                      }
                    },
                  ),
                  Observer(
                    builder: (context) {
                      if (GetIt.I<UserManagerStore>().isLoggedIn) {
                        return CreateAdButton(
                          scrollController: scrollController,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
