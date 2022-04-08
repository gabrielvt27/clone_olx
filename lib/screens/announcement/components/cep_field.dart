import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_olx/models/address.dart';
import 'package:clone_olx/stores/announcement_store.dart';
import 'package:clone_olx/stores/cep_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CepField extends StatelessWidget {
  const CepField({
    Key? key,
    required this.announcementStore,
  }) : super(key: key);

  final AnnouncementStore announcementStore;

  @override
  Widget build(BuildContext context) {
    final CepStore cepStore = announcementStore.cepStore;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          initialValue: cepStore.cep,
          onChanged: cepStore.setCep,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          decoration: InputDecoration(
            labelText: 'CEP *',
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey,
              fontSize: 18,
            ),
            contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
            errorText: announcementStore.addressError,
          ),
        ),
        Observer(
          builder: (context) {
            if (cepStore.address == null &&
                cepStore.error == null &&
                !cepStore.loading) {
              return Container();
            } else if (cepStore.address == null && cepStore.error == null) {
              return const LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple),
                backgroundColor: Colors.transparent,
              );
            } else if (cepStore.error != null) {
              return Container(
                color: Colors.red.withAlpha(100),
                height: 50,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  cepStore.error!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              );
            } else {
              Address endereco = cepStore.address!;

              return Container(
                color: Colors.purple.withAlpha(150),
                height: 50,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  'Localização: ${endereco.district}, ${endereco.city.nome} - ${endereco.uf.sigla}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
