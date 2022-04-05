import 'package:clone_olx/models/announcement.dart';
import 'package:flutter/material.dart';

class LocationPanel extends StatelessWidget {
  const LocationPanel({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final Announcement ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Localização",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('CEP'),
                  SizedBox(height: 12),
                  Text('Município'),
                  SizedBox(height: 12),
                  Text('Bairro'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ad.address.cep),
                  const SizedBox(height: 12),
                  Text(ad.address.city.nome),
                  const SizedBox(height: 12),
                  Text(ad.address.district),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
