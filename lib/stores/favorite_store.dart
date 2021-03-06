import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/repositories/favorite_repository.dart';
import 'package:clone_olx/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  _FavoriteStoreBase() {
    reaction(
      (p0) => userManagerStore.isLoggedIn,
      (p0) {
        _getFavoritesList();
      },
    );
  }

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  ObservableList<Announcement> favoriteList = ObservableList<Announcement>();

  Future<void> _getFavoritesList() async {
    try {
      favoriteList.clear();
      final favorites =
          await FavoriteRepository().getFavorites(userManagerStore.user!);
      favoriteList.addAll(favorites);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> toogleFavorite(Announcement ad) async {
    try {
      if (favoriteList.any((element) => element.id == ad.id)) {
        favoriteList.removeWhere((element) => element.id == ad.id);
        await FavoriteRepository().delete(ad: ad, user: userManagerStore.user!);
      } else {
        favoriteList.add(ad);
        await FavoriteRepository().save(ad: ad, user: userManagerStore.user!);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
