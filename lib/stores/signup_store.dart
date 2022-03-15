import 'dart:ui';

import 'package:clone_olx/repositories/user_repository.dart';
import 'package:clone_olx/stores/user_manager_store.dart';
import 'package:clone_olx/view_model/user_signup_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:clone_olx/helpers/extensions.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String? name;

  @action
  void setName(String val) => name = val;

  @computed
  bool get nameValid => name != null && name!.length > 6;

  @computed
  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  @observable
  String? email;

  @action
  void setEmail(String val) => email = val;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  @computed
  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @observable
  String? phone;

  @action
  void setPhone(String val) => phone = val;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;

  @computed
  String? get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  @observable
  String? pass;

  @action
  void setPass(String val) => pass = val;

  @computed
  bool get passValid => pass != null && pass!.length >= 6;

  @computed
  String? get passError {
    if (pass == null || passValid) {
      return null;
    } else if (pass!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha muito curta';
    }
  }

  @observable
  String? confirmPass;

  @action
  void setConfirmPass(String val) => confirmPass = val;

  @computed
  bool get confirmPassValid => confirmPass != null && confirmPass == pass;

  @computed
  String? get confirmPassError {
    if (confirmPass == null || confirmPassValid) {
      return null;
    } else if (confirmPass!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senhas precisam ser iguais';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && passValid && confirmPassValid;

  @computed
  VoidCallback? get signUpPressed => isFormValid && !loading ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  Future<void> _signUp() async {
    loading = true;
    error = null;

    final user = UserSigupViewModel(
      name: name!,
      email: email!,
      phone: phone!,
      password: pass!,
    );

    try {
      final resultUser = await UserRepository().signUp(user);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
