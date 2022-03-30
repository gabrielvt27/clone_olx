import 'package:clone_olx/screens/home/components/buttonbar.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonBarWidget(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white),
            ),
          ),
          label: "Categorias",
          onTap: () {},
        ),
        ButtonBarWidget(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white),
            ),
          ),
          label: "Filtros",
          onTap: () {},
        ),
      ],
    );
  }
}
