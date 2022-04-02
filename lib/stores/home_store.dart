import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/repositories/announcement_repository.dart';
import 'package:clone_olx/stores/filter_store.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    autorun((_) async {
      final newAdList = await AnnouncementRepository().getHomeAdList(
        filter: filterStore,
        search: searchText,
        category: category,
      );

      print(newAdList);
    });
  }

  @observable
  String searchText = '';

  @action
  void setSearchText(String val) => searchText = val;

  @observable
  Category? category;

  @action
  void setCategory(Category val) => category = val;

  @observable
  FilterStore filterStore = FilterStore();

  @action
  void setFilterStore(FilterStore val) => filterStore = val;
}
