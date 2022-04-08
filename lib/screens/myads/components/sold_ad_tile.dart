import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_olx/screens/ad/ad_screen.dart';
import 'package:clone_olx/stores/myads_store.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:clone_olx/helpers/extensions.dart';
import 'package:clone_olx/models/announcement.dart';

class SoldAdTile extends StatelessWidget {
  const SoldAdTile({
    Key? key,
    required this.ad,
    required this.store,
  }) : super(key: key);

  final Announcement ad;
  final MyAdsStore store;

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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Excluir'),
                          content: Text('Confirmar a exclusão de ${ad.title}?'),
                          actions: [
                            TextButton(
                              onPressed: Navigator.of(context).pop,
                              child: const Text(
                                'Não',
                                style: TextStyle(color: Colors.purple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                store.deleteAd(ad);
                              },
                              child: const Text(
                                'Sim',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
