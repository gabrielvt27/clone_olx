import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

enum OrderBy { date, price }

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
}
