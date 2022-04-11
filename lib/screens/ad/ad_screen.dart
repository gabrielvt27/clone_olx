import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/screens/ad/components/bottom_bar.dart';
import 'package:clone_olx/screens/ad/components/description_panel.dart';
import 'package:clone_olx/screens/ad/components/location_panel.dart';
import 'package:clone_olx/screens/ad/components/main_panel.dart';
import 'package:clone_olx/screens/ad/components/user_panel.dart';
import 'package:clone_olx/stores/favorite_store.dart';
import 'package:clone_olx/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AdScreen extends StatelessWidget {
  AdScreen({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Announcement ad;

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Anúncio'),
        centerTitle: true,
        actions: [
          if (ad.status == AnnouncementStatus.active &&
              userManagerStore.isLoggedIn)
            Observer(
              builder: (_) {
                return IconButton(
                  onPressed: () {
                    favoriteStore.toogleFavorite(ad);
                  },
                  icon: Icon(
                    favoriteStore.favoriteList
                            .any((element) => element.id == ad.id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                );
              },
            ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 280,
                child: Carousel(
                  images: ad.images
                      .map((img) => CachedNetworkImageProvider(img.url))
                      .toList(),
                  dotSize: 4,
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.orange,
                  autoplay: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: ad.status != AnnouncementStatus.pending ? 110 : 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainPanel(ad: ad),
                    const Divider(),
                    DescriptionPanel(ad: ad),
                    const Divider(),
                    LocationPanel(ad: ad),
                    const Divider(),
                    UserPanel(ad: ad),
                  ],
                ),
              )
            ],
          ),
          if (ad.status != AnnouncementStatus.pending) BottomBar(ad: ad),
        ],
      ),
    );
  }
}
