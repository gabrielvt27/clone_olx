import 'package:clone_olx/components/custom_drawer/custom_drawer.dart';
import 'package:clone_olx/screens/favorite/components/favorite_tile.dart';
import 'package:clone_olx/screens/myads/components/empty_card.dart';
import 'package:clone_olx/stores/favorite_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({
    Key? key,
    this.hideDrawer = false,
  }) : super(key: key);

  final bool hideDrawer;

  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        centerTitle: true,
      ),
      drawer: hideDrawer ? null : CustomDrawer(),
      body: Observer(
        builder: (context) {
          if (favoriteStore.favoriteList.isEmpty) {
            return const EmptyCard(text: 'Nenhum anúncio favoritado');
          } else {
            return ListView.builder(
              itemCount: favoriteStore.favoriteList.length,
              itemBuilder: (context, index) {
                return FavoriteTile(ad: favoriteStore.favoriteList[index]);
              },
            );
          }
        },
      ),
    );
  }
}
