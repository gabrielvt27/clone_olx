import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_olx/screens/ad/ad_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:clone_olx/helpers/extensions.dart';
import 'package:clone_olx/models/announcement.dart';

class SoldAdTile extends StatelessWidget {
  const SoldAdTile({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Announcement ad;

  @override
  Widget build(BuildContext context) {
    final String imageUrl = (ad.images.isEmpty)
        ? 'https://static.thenounproject.com/png/194055-200.png'
        : (ad.images.first as ParseFile).url!;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AdScreen(ad: ad)),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ad.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ad.price.formattedMoney(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.purple,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
