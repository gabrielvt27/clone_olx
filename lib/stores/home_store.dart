import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/repositories/announcement_repository.dart';
import 'package:clone_olx/stores/filter_store.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    autorun((_) async {
      try {
        loading = true;

        final newAdList = await AnnouncementRepository().getHomeAdList(
          filter: filterStore,
          search: searchText,
          category: category,
        );

        adList.clear();
        adList.addAll(newAdList);
        loading = false;
        setError(null);
      } catch (e) {
        setError(e.toString());
      }
    });
  }

  ObservableList<Announcement> adList = ObservableList<Announcement>();

  @observable
  bool loading = false;

  @action
  void setLoading(bool val) => loading = val;

  @observable
  String? error;

  @action
  void setError(String? val) => error = val;

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
