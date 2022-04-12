import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/repositories/category_repository.dart';
import 'package:clone_olx/stores/connection_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  final ConnectionStore connectionStore = GetIt.I<ConnectionStore>();

  _CategoryStoreBase() {
    autorun((_) {
      if (connectionStore.connected && categoryList.isEmpty && !loading) {
        _loadCategories();
      }
    });
  }

  bool loading = false;

  ObservableList<Category> categoryList = ObservableList<Category>();

  @computed
  List<Category> get allCategoryList => List.from(categoryList)
    ..insert(0, Category(id: '*', description: 'Todas'));

  @action
  void setCategories(List<Category> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @observable
  String? error;

  @action
  void setError(String val) => error = val;

  Future<void> _loadCategories() async {
    loading = true;
    try {
      final categories = await CategoryRepository().getList();

      setCategories(categories);
    } catch (e) {
      setError(e.toString());
    }
    loading = false;
  }
}
