import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/screens/ad/components/main_panel.dart';
import 'package:flutter/material.dart';

class AdScreen extends StatelessWidget {
  const AdScreen({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Announcement ad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Anúncio'),
        centerTitle: true,
      ),
      body: ListView(
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainPanel(ad: ad),
                const Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
