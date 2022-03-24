import 'package:clone_olx/models/category.dart';
import 'package:mobx/mobx.dart';
part 'announcement_store.g.dart';

class AnnouncementStore = _AnnouncementStoreBase with _$AnnouncementStore;

abstract class _AnnouncementStoreBase with Store {
  ObservableList images = ObservableList();

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  bool? hidePhone = false;

  @action
  void setHidePhone(bool? value) => hidePhone = value;
}
