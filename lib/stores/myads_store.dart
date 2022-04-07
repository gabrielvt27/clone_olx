import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/repositories/announcement_repository.dart';
import 'package:clone_olx/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'myads_store.g.dart';

class MyAdsStore = _MyAdsStoreBase with _$MyAdsStore;

abstract class _MyAdsStoreBase with Store {
  _MyAdsStoreBase() {
    _getMyAds();
  }

  @observable
  List<Announcement> allAds = [];

  @computed
  List<Announcement> get activeAds =>
      allAds.where((ad) => ad.status == AnnouncementStatus.active).toList();
  @computed
  List<Announcement> get pendingAds =>
      allAds.where((ad) => ad.status == AnnouncementStatus.pending).toList();
  @computed
  List<Announcement> get soldAds =>
      allAds.where((ad) => ad.status == AnnouncementStatus.sold).toList();

  @action
  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManagerStore>().user;

    try {
      allAds = await AnnouncementRepository().getMyAds(user!);
    } catch (e) {}
  }
}
