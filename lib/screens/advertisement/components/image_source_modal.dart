import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceModal extends StatelessWidget {
  const ImageSourceModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Câmera"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Galeria"),
              ),
            ],
          );
        },
      );
    } else {
      return CupertinoActionSheet(
        title: const Text("Selecionar foto para o anúncio"),
        message: const Text("Escolha a origem da foto"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {},
            child: const Text("Câmera"),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: const Text("Galeria"),
          ),
        ],
      );
    }
  }
}
