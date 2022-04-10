import 'package:clone_olx/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

import '../models/user.dart';
part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStoreBase with _$UserManagerStore;

abstract class _UserManagerStoreBase with Store {
  _UserManagerStoreBase() {
    _getCurrentUser();
  }

  @observable
  User? user;

  @action
  void setUser(User? val) => user = val;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }

  Future<void> logout() async {
    await UserRepository().logout();

    setUser(null);
  }
}
