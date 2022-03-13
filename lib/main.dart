import 'package:clone_olx/appwidget.dart';
import 'package:clone_olx/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const AppWidget());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
}

Future<void> initializeParse() async {
  Parse().initialize(
    'obje0rG4oYWBE7QUzNiXquPqW8S817IijhiVcvMi',
    'https://parseapi.back4app.com/',
    clientKey: 'JDDGsyjLeLbv9zVkdL2wR5oHDdf0WevNzbuOnlLG',
    autoSendSessionId: true,
    debug: true,
  );
}
