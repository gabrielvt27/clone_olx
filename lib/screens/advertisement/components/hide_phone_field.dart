import 'package:clone_olx/stores/announcement_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HidePhoneField extends StatelessWidget {
  const HidePhoneField({
    Key? key,
    required this.announcementStore,
  }) : super(key: key);

  final AnnouncementStore announcementStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(
            builder: (_) {
              return Checkbox(
                value: announcementStore.hidePhone,
                onChanged: announcementStore.setHidePhone,
                activeColor: Colors.purple,
              );
            },
          ),
          const Expanded(
            child: Text("Ocultar o meu telefone neste anúncio"),
          ),
        ],
      ),
    );
  }
}
