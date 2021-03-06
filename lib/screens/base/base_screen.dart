import 'package:clone_olx/screens/account/account_screen.dart';
import 'package:clone_olx/screens/announcement/announcement_screen.dart';
import 'package:clone_olx/screens/favorite/favorite_screen.dart';
import 'package:clone_olx/screens/home/home_screen.dart';
import 'package:clone_olx/screens/offiline/offiline_screen.dart';
import 'package:clone_olx/stores/connection_store.dart';
import 'package:clone_olx/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final PageStore pageStore = GetIt.I<PageStore>();
  final ConnectionStore connectionStore = GetIt.I<ConnectionStore>();

  @override
  void initState() {
    super.initState();

    reaction(
      (_) => pageStore.page,
      <int>(page) => pageController.jumpToPage(page),
    );

    autorun((_) {
      if (!connectionStore.connected) {
        Future.delayed(const Duration(milliseconds: 50)).then((value) {
          showDialog(context: context, builder: (_) => const OffilineScreen());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          const AnnouncementScreen(),
          Container(
            color: Colors.yellow,
          ),
          FavoriteScreen(),
          const AccountScreen(),
        ],
      ),
    );
  }
}
