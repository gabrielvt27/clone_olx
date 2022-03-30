import 'package:flutter/material.dart';

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({
    Key? key,
    required this.decoration,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final BoxDecoration decoration;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          decoration: decoration,
        ),
      ),
    );
  }
}
