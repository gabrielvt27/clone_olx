import 'package:clone_olx/screens/base/base_screen.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLX Clone',
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.orange,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.purple,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const BaseScreen(),
    );
  }
}
