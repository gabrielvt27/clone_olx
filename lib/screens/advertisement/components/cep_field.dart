import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_olx/stores/cep_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CepField extends StatelessWidget {
  CepField({Key? key}) : super(key: key);

  final CepStore cepStore = CepStore();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: cepStore.setCep,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CepInputFormatter(),
      ],
      decoration: const InputDecoration(
        labelText: 'CEP *',
        labelStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.grey,
          fontSize: 18,
        ),
        contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
      ),
    );
  }
}
