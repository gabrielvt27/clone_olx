import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_olx/components/custom_drawer/custom_drawer.dart';
import 'package:clone_olx/components/error_box.dart';
import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/screens/announcement/components/category_field.dart';
import 'package:clone_olx/screens/announcement/components/cep_field.dart';
import 'package:clone_olx/screens/announcement/components/hide_phone_field.dart';
import 'package:clone_olx/screens/announcement/components/images_field.dart';
import 'package:clone_olx/screens/myads/myads_screen.dart';
import 'package:clone_olx/stores/announcement_store.dart';
import 'package:clone_olx/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({
    Key? key,
    this.ad,
  }) : super(key: key);

  final Announcement? ad;

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState(ad);
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  _AnnouncementScreenState(Announcement? ad)
      : editing = ad != null,
        announcementStore = AnnouncementStore(ad);

  final AnnouncementStore announcementStore;

  bool editing;

  @override
  void initState() {
    super.initState();

    when((_) => announcementStore.savedAd, () {
      if (editing) {
        Navigator.of(context).pop(true);
      } else {
        GetIt.I<PageStore>().setPage(0);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MyAdsScreen(),
          ),
        );
      }
    });
  }

  final labelStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.grey,
    fontSize: 18,
  );

  final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: editing ? null : CustomDrawer(),
      appBar: AppBar(
        title: Text(editing ? 'Editar Anúncio' : 'Criar Anúncio'),
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
              child: Observer(
                builder: (context) {
                  if (announcementStore.loading) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: const [
                          Text(
                            'Salvando Anúncio',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.purple),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImagesField(
                          announcementStore: announcementStore,
                        ),
                        Observer(
                          builder: (_) {
                            return TextFormField(
                              initialValue: announcementStore.title,
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
                            initialValue: announcementStore.description,
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
                            initialValue: announcementStore.priceText,
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
                          return ErrorBox(
                            message: announcementStore.errorSend,
                          );
                        }),
                        Observer(builder: (_) {
                          return GestureDetector(
                            onTap: announcementStore.invalidSendPressed,
                            child: MaterialButton(
                              height: 50,
                              color: Colors.orange,
                              disabledColor: Colors.orange.withAlpha(120),
                              child: const Text(
                                'Enviar',
                                style: TextStyle(fontSize: 18),
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              textColor: Colors.white,
                              onPressed: announcementStore.sendPressed,
                            ),
                          );
                        }),
                      ],
                    );
                  }
                },
              )),
        ),
      ),
    );
  }
}
