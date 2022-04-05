import 'package:clone_olx/models/announcement.dart';
import 'package:flutter/material.dart';
import 'package:clone_olx/helpers/extensions.dart';

class MainPanel extends StatelessWidget {
  const MainPanel({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Announcement ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            ad.price.formattedMoney(),
            style: const TextStyle(
              fontSize: 34,
              letterSpacing: 2.8,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          ad.title,
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            'Publicado em ${ad.createAt.formattedDate()}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
