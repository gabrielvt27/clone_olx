import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_olx/screens/ad/ad_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:clone_olx/helpers/extensions.dart';
import 'package:clone_olx/models/announcement.dart';

class ActiveAdTile extends StatelessWidget {
  ActiveAdTile({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Announcement ad;

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, title: 'Já vendi', iconData: Icons.thumb_up),
    MenuChoice(index: 2, title: 'Excluir', iconData: Icons.delete),
  ];

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
                  padding: const EdgeInsets.all(8.0),
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
                      Text(
                        '${ad.views} visitas',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  PopupMenuButton<MenuChoice>(
                    onSelected: (choice) {
                      switch (choice.index) {
                        case 0:
                          break;
                        case 1:
                          break;
                        case 2:
                          break;
                        default:
                          break;
                      }
                    },
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 20,
                      color: Colors.purple,
                    ),
                    itemBuilder: (context) {
                      return choices
                          .map((choice) => PopupMenuItem<MenuChoice>(
                                value: choice,
                                child: Row(
                                  children: [
                                    Icon(
                                      choice.iconData,
                                      size: 20,
                                      color: Colors.purple,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      choice.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList();
                    },
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

class MenuChoice {
  final int index;
  final String title;
  final IconData iconData;

  MenuChoice({
    required this.index,
    required this.title,
    required this.iconData,
  });
}
