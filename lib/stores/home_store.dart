import 'package:clone_olx/constants.dart';
import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/repositories/announcement_repository.dart';
import 'package:clone_olx/stores/connection_store.dart';
import 'package:clone_olx/stores/filter_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final ConnectionStore connectionStore = GetIt.I<ConnectionStore>();

  _HomeStoreBase() {
    autorun((_) async {
      if (connectionStore.connected && adList.isEmpty && !loading) {
        setLoading(true);
        try {
          final newAdList = await AnnouncementRepository().getHomeAdList(
            filter: filterStore,
            search: searchText,
            category: category,
            page: page,
          );

          addNewAds(newAdList);
          setError(null);
        } catch (e) {
          setError(e.toString());
        }
        setLoading(false);
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
  void setSearchText(String val) {
    searchText = val;
    resetPage();
  }

  @observable
  Category? category;

  @action
  void setCategory(Category val) {
    category = val;
    resetPage();
  }

  @observable
  FilterStore filterStore = FilterStore();

  @action
  void setFilterStore(FilterStore val) {
    filterStore = val;
    resetPage();
  }

  @observable
  int page = 0;

  @action
  void loadingNextPage() => page++;

  @action
  void resetPage() {
    page = 0;
    adList.clear();
    setLastPage(false);
  }

  @observable
  bool lastPage = false;

  @action
  void setLastPage(bool val) => lastPage = val;

  @computed
  int get itemCount => lastPage ? adList.length : adList.length + 1;

  @action
  void addNewAds(List<Announcement> newAds) {
    if (newAds.length < kMaxAnnouncementByPage) {
      setLastPage(true);
    }
    adList.addAll(newAds);
  }

  @computed
  bool get showProgress => loading && adList.isEmpty;
}
