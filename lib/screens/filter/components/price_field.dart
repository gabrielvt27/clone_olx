import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  const PriceField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final int? initialValue;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        initialValue: initialValue?.toString(),
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixText: 'R\$ ',
          focusColor: Colors.purple,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
              width: 1.5,
            ),
          ),
          isDense: true,
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.purple,
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(moeda: false),
        ],
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
