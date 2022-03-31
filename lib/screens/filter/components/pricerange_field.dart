import 'package:clone_olx/screens/filter/components/price_field.dart';
import 'package:clone_olx/screens/filter/components/section_title.dart';
import 'package:clone_olx/stores/filter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField({
    Key? key,
    required this.filterStore,
  }) : super(key: key);

  final FilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Preço"),
        Observer(
          builder: (_) {
            return Row(
              children: [
                PriceField(
                  label: "Mín.",
                  initialValue: filterStore.minPrice,
                  onChanged: filterStore.setMinPrice,
                ),
                const SizedBox(
                  width: 12,
                ),
                PriceField(
                  label: "Máx.",
                  initialValue: filterStore.maxPrice,
                  onChanged: filterStore.setMaxPrice,
                ),
              ],
            );
          },
        ),
        Observer(
          builder: (context) {
            if (filterStore.priceError != null) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  filterStore.priceError!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
