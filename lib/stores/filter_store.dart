// ignore_for_file: constant_identifier_names

import 'package:clone_olx/stores/home_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

enum OrderBy { date, price }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {
  _FilterStoreBase({
    this.orderBy = OrderBy.date,
    this.maxPrice,
    this.minPrice,
    this.vendorType = VENDOR_TYPE_PARTICULAR,
  });

  @observable
  OrderBy orderBy = OrderBy.date;

  @action
  void setOrderBy(OrderBy val) => orderBy = val;

  int? convertStringToInt(str) => int.tryParse(str.replaceAll('.', ''));

  @observable
  int? maxPrice;

  @action
  void setMaxPrice(String val) => maxPrice = convertStringToInt(val);

  @observable
  int? minPrice;

  @action
  void setMinPrice(String val) => minPrice = convertStringToInt(val);

  @computed
  bool get priceValid =>
      minPrice != null && maxPrice != null && minPrice! < maxPrice!;

  @computed
  String? get priceError =>
      (priceValid || (maxPrice == null && minPrice == null))
          ? null
          : 'Faixa de preço inválida';

  @observable
  int vendorType = VENDOR_TYPE_PARTICULAR;

  @action
  void selectVendorType(int val) => vendorType = val;

  @action
  void setVendorType(int type) => vendorType = vendorType | type;

  @action
  void resetVendorType(int type) => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular => (vendorType & VENDOR_TYPE_PARTICULAR) != 0;

  @computed
  bool get isTypeProfessional => (vendorType & VENDOR_TYPE_PROFESSIONAL) != 0;

  @computed
  bool get isFormValid => priceError == null;

  void save() {
    GetIt.I<HomeStore>().setFilterStore(
      FilterStore(
        maxPrice: maxPrice,
        minPrice: minPrice,
        orderBy: orderBy,
        vendorType: vendorType,
      ),
    );
  }
}
