import 'package:clone_olx/screens/filter/components/section_title.dart';
import 'package:clone_olx/stores/filter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class VendorTypeField extends StatelessWidget {
  const VendorTypeField({
    Key? key,
    required this.filterStore,
  }) : super(key: key);

  final FilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle(title: "Tipo de anunciante"),
        Observer(
          builder: (context) {
            return Wrap(
              runSpacing: 4,
              children: [
                GestureDetector(
                  onTap: () {
                    if (filterStore.isTypeParticular) {
                      if (filterStore.isTypeProfessional) {
                        filterStore.resetVendorType(VENDOR_TYPE_PARTICULAR);
                      } else {
                        filterStore.selectVendorType(VENDOR_TYPE_PROFESSIONAL);
                      }
                    } else {
                      filterStore.setVendorType(VENDOR_TYPE_PARTICULAR);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: filterStore.isTypeParticular
                          ? Colors.purple
                          : Colors.transparent,
                      border: Border.all(color: Colors.purple),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Particular',
                      style: TextStyle(
                        color: filterStore.isTypeParticular
                            ? Colors.white
                            : Colors.purple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    if (filterStore.isTypeProfessional) {
                      if (filterStore.isTypeParticular) {
                        filterStore.resetVendorType(VENDOR_TYPE_PROFESSIONAL);
                      } else {
                        filterStore.selectVendorType(VENDOR_TYPE_PARTICULAR);
                      }
                    } else {
                      filterStore.setVendorType(VENDOR_TYPE_PROFESSIONAL);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: filterStore.isTypeProfessional
                          ? Colors.purple
                          : Colors.transparent,
                      border: Border.all(color: Colors.purple),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Profissional',
                      style: TextStyle(
                        color: filterStore.isTypeProfessional
                            ? Colors.white
                            : Colors.purple,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
