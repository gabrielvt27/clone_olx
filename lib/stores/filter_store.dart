// ignore_for_file: constant_identifier_names

import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

enum OrderBy { date, price }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {
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
  String? get priceError => priceValid ? null : 'Faixa de preço inválida';

  @observable
  int vendorType = 0;

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
}
