import 'package:clone_olx/screens/filter/components/orderby_field.dart';
import 'package:clone_olx/screens/filter/components/pricerange_field.dart';
import 'package:clone_olx/screens/filter/components/vendortype_field.dart';
import 'package:clone_olx/stores/filter_store.dart';
import 'package:clone_olx/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);

  final FilterStore filterStore = GetIt.I<HomeStore>().filterStore;

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderByField(
                  filterStore: filterStore,
                ),
                PriceRangeField(
                  filterStore: filterStore,
                ),
                VendorTypeField(
                  filterStore: filterStore,
                ),
                Observer(
                  builder: (_) {
                    return Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        onPressed: filterStore.isFormValid
                            ? () {
                                filterStore.save();
                                Navigator.of(context).pop();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onSurface: Colors.orange.withAlpha(120),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          "FILTRAR",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
