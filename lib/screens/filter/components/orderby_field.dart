import 'dart:ffi';

import 'package:clone_olx/screens/filter/components/section_title.dart';
import 'package:flutter/material.dart';

class OrderByField extends StatelessWidget {
  const OrderByField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildButtonOption(String label) {
      return Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.purple,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: "Ordenar por",
        ),
        Row(
          children: [
            buildButtonOption("Data"),
            const SizedBox(
              width: 12,
            ),
            buildButtonOption("Preço"),
          ],
        ),
      ],
    );
  }
}
