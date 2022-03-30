import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchDialog extends StatelessWidget {
  SearchDialog({
    Key? key,
    currentSearchText,
  })  : controller = TextEditingController(text: currentSearchText),
        super(key: key);

  String? currentSearchText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: controller,
              autofocus: true,
              textInputAction: TextInputAction.search,
              onSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
                prefixIcon: IconButton(
                  onPressed: Navigator.of(context).pop,
                  color: Colors.grey,
                  icon: const Icon(Icons.arrow_back),
                ),
                suffixIcon: IconButton(
                  onPressed: controller.clear,
                  color: Colors.grey,
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
