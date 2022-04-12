import 'package:clone_olx/components/custom_drawer/custom_drawer.dart';
import 'package:clone_olx/screens/edit_account/edit_account_screen.dart';
import 'package:clone_olx/screens/favorite/favorite_screen.dart';
import 'package:clone_olx/screens/myads/myads_screen.dart';
import 'package:clone_olx/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha Conta"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 140,
                child: Stack(
                  children: [
                    Observer(
                      builder: (_) {
                        return Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                GetIt.I<UserManagerStore>().user!.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                GetIt.I<UserManagerStore>().user!.email,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditAccountScreens(),
                            ),
                          );
                        },
                        child: const Text(
                          "EDITAR",
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  "Meus anúncios",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const MyAdsScreen()),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  "Favoritos",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FavoriteScreen(
                      hideDrawer: true,
                    ),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
