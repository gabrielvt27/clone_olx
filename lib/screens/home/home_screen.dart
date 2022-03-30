import 'package:clone_olx/components/custom_drawer/custom_drawer.dart';
import 'package:clone_olx/screens/home/components/search_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _openSearch(BuildContext context) async {
    final searchText = await showDialog(
      context: context,
      builder: (_) => SearchDialog(),
    );

    print(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                _openSearch(context);
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
