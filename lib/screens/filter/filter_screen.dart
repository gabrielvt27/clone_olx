import 'package:clone_olx/screens/filter/components/orderby_field.dart';
import 'package:clone_olx/stores/filter_store.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);

  final FilterStore filterStore = FilterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtrar Busca"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderByField(
                  filterStore: filterStore,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
