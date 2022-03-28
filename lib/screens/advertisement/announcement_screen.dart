import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_olx/components/custom_drawer/custom_drawer.dart';
import 'package:clone_olx/screens/advertisement/components/category_field.dart';
import 'package:clone_olx/screens/advertisement/components/cep_field.dart';
import 'package:clone_olx/screens/advertisement/components/hide_phone_field.dart';
import 'package:clone_olx/screens/advertisement/components/images_field.dart';
import 'package:clone_olx/stores/announcement_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AnnouncementScreen extends StatelessWidget {
  AnnouncementScreen({Key? key}) : super(key: key);

  final AnnouncementStore announcementStore = AnnouncementStore();

  final labelStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.grey,
    fontSize: 18,
  );

  final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ImagesField(
                  announcementStore: announcementStore,
                ),
                Observer(
                  builder: (_) {
                    return TextFormField(
                      onChanged: announcementStore.setTitle,
                      decoration: InputDecoration(
                        labelText: "Título *",
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                        errorText: announcementStore.titleError,
                      ),
                    );
                  },
                ),
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: announcementStore.setDescription,
                    decoration: InputDecoration(
                      labelText: "Descrição *",
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                      errorText: announcementStore.descriptionError,
                    ),
                    maxLines: null,
                  );
                }),
                CategoryField(
                  announcementStore: announcementStore,
                ),
                CepField(
                  announcementStore: announcementStore,
                ),
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: announcementStore.setPrice,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CentavosInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      labelText: "Preço *",
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                      prefixText: "R\$ ",
                      errorText: announcementStore.priceError,
                    ),
                  );
                }),
                HidePhoneField(
                  announcementStore: announcementStore,
                ),
                Observer(builder: (_) {
                  return MaterialButton(
                    height: 50,
                    color: Colors.orange,
                    disabledColor: Colors.orange.withAlpha(120),
                    child: const Text(
                      'Enviar',
                      style: TextStyle(fontSize: 18),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textColor: Colors.white,
                    onPressed: announcementStore.sendPressed,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
