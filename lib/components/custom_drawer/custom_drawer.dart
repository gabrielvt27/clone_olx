import 'package:clone_olx/components/custom_drawer/custom_drawer_header.dart';
import 'package:clone_olx/components/custom_drawer/page_section.dart';
import 'package:clone_olx/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
          child: ListView(
            children: [
              CustomDrawerHeader(),
              if (userManagerStore.isLoggedIn) PageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
