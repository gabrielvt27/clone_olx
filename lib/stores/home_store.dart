import 'package:clone_olx/models/category.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  String searchText = '';

  @action
  void setSearchText(String val) => searchText = val;

  @observable
  Category? category;

  @action
  void setCategory(Category val) => category = val;
}
