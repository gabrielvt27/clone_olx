import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  const ImageSourceModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                onPressed: getFromCamera,
                child: const Text("Câmera"),
              ),
              TextButton(
                onPressed: getFromGallery,
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
            onPressed: getFromCamera,
            child: const Text("Câmera"),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child: const Text("Galeria"),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text(
            "Cancelar",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: Navigator.of(context).pop,
        ),
      );
    }
  }

  Future<void> getFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    final image = File(pickedFile!.path);
    imageSelected(image);
  }

  Future<void> getFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    final image = File(pickedFile!.path);
    imageSelected(image);
  }

  void imageSelected(File image) {
    print(image.path);
  }
}
