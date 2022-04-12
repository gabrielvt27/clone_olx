import 'package:clone_olx/stores/connection_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class OffilineScreen extends StatefulWidget {
  const OffilineScreen({Key? key}) : super(key: key);

  @override
  State<OffilineScreen> createState() => _OffilineScreenState();
}

class _OffilineScreenState extends State<OffilineScreen> {
  final ConnectionStore connectionStore = GetIt.I<ConnectionStore>();

  @override
  void initState() {
    super.initState();

    when((_) => connectionStore.connected, Navigator.of(context).pop);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('OLX'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              child: Center(
                child: Text(
                  'Sem conexão com a internet!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.cloud_off,
              color: Colors.white,
              size: 150,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Por favor, verifique a sua conexão com a internet para'
                'continar a usar o app.',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
