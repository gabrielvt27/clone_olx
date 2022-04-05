import 'package:clone_olx/models/announcement.dart';
import 'package:flutter/material.dart';
import 'package:clone_olx/helpers/extensions.dart';

class UserPanel extends StatelessWidget {
  const UserPanel({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Announcement ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Anunciante",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ad.user.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Na XLO desde ${ad.user.createdAt.formattedDate()}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
