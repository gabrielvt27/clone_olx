import 'package:clone_olx/screens/filter/components/section_title.dart';
import 'package:clone_olx/stores/filter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderByField extends StatelessWidget {
  const OrderByField({
    Key? key,
    required this.filterStore,
  }) : super(key: key);

  final FilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    Widget buildButtonOption(String label, OrderBy option) {
      return GestureDetector(
        onTap: () {
          filterStore.setOrderBy(option);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: filterStore.orderBy == option
                ? Colors.purple
                : Colors.transparent,
            border: Border.all(
              color: Colors.purple,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color:
                  filterStore.orderBy == option ? Colors.white : Colors.purple,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: "Ordenar por",
        ),
        Observer(
          builder: (_) {
            return Row(
              children: [
                buildButtonOption("Data", OrderBy.date),
                const SizedBox(
                  width: 12,
                ),
                buildButtonOption("Preço", OrderBy.price),
              ],
            );
          },
        ),
      ],
    );
  }
}
