import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

enum OrderBy { date, price }

class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {
  @observable
  OrderBy orderBy = OrderBy.date;

  @action
  void setOrderBy(OrderBy val) => orderBy = val;
}
