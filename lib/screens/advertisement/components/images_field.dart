import 'dart:io';

import 'package:clone_olx/screens/advertisement/components/image_dialog.dart';
import 'package:clone_olx/screens/advertisement/components/image_source_modal.dart';
import 'package:clone_olx/stores/announcement_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ImagesField extends StatelessWidget {
  const ImagesField({
    Key? key,
    required this.announcementStore,
  }) : super(key: key);

  final AnnouncementStore announcementStore;
  final maxImages = 5;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      announcementStore.images.add(image);
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(builder: (context) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: announcementStore.images.length < maxImages
              ? announcementStore.images.length + 1
              : maxImages,
          itemBuilder: (context, index) {
            if (index == announcementStore.images.length) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    if (Platform.isAndroid) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => ImageSourceModal(
                          onImageSelected: onImageSelected,
                        ),
                      );
                    } else {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => ImageSourceModal(
                          onImageSelected: onImageSelected,
                        ),
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ImageDialog(
                        image: announcementStore.images[index],
                        onDelete: () =>
                            announcementStore.images.removeAt(index),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage: FileImage(announcementStore.images[index]),
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
