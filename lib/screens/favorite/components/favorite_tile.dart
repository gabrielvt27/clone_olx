import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/screens/ad/ad_screen.dart';
import 'package:clone_olx/stores/favorite_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:clone_olx/helpers/extensions.dart';

class FavoriteTile extends StatelessWidget {
  FavoriteTile({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Announcement ad;

  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    final String imageUrl = (ad.images.isEmpty)
        ? 'https://static.thenounproject.com/png/194055-200.png'
        : (ad.images.first as ParseFile).url!;

    final String endereco =
        '${ad.createAt.formattedDate()} - ${ad.address.city.nome} - ${ad.address.uf.sigla}';
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AdScreen(ad: ad)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 6,
        ),
        height: 135,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
          child: Row(
            children: [
              SizedBox(
                height: 135,
                width: 127,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ad.title),
                      Text(
                        ad.price.formattedMoney(),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              endereco,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => favoriteStore.toogleFavorite(ad),
                            child: const Icon(
                              Icons.delete_outline,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
