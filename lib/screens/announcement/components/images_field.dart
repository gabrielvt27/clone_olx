import 'dart:io';

import 'package:clone_olx/screens/announcement/components/image_dialog.dart';
import 'package:clone_olx/screens/announcement/components/image_source_modal.dart';
import 'package:clone_olx/stores/announcement_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

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

    return Column(
      children: [
        Container(
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
                  final Object image = (announcementStore.images[index] is File)
                      ? FileImage(announcementStore.images[index])
                      : NetworkImage(
                          (announcementStore.images[index] as ParseFile).url!);
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
                        backgroundImage: image as ImageProvider,
                      ),
                    ),
                  );
                }
              },
            );
          }),
        ),
        Observer(builder: (_) {
          if (announcementStore.imagesError.isNotEmpty) {
            return Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: Colors.red,
                )),
              ),
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              child: Text(
                announcementStore.imagesError,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            );
          } else {
            return Container();
          }
        })
      ],
    );
  }
}
