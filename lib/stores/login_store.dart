import 'dart:ui';

import 'package:clone_olx/repositories/user_repository.dart';
import 'package:clone_olx/stores/user_manager_store.dart';
import 'package:clone_olx/view_models/user_login_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:clone_olx/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String? email;

  @action
  void setEmail(String val) => email = val;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  @computed
  String? get emailError =>
      (email == null || emailValid) ? null : 'E-mail inválido';

  @observable
  String? pass;

  @action
  void setPass(String val) => pass = val;

  @computed
  bool get passValid => pass != null && pass!.length >= 4;

  @computed
  String? get passError =>
      (pass == null || passValid) ? null : 'Senha inválida';

  @computed
  VoidCallback? get loginPressed =>
      emailValid && passValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  Future<void> _login() async {
    loading = true;
    error = null;

    final user = UserLoginViewModel(
      email: email!,
      password: pass!,
    );

    try {
      final resultUser = await UserRepository().loginWithEmail(user);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
