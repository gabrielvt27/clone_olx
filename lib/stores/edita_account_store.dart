import 'package:clone_olx/models/user.dart';
import 'package:mobx/mobx.dart';
part 'edita_account_store.g.dart';

class EditAccountStore = _EditAccountStoreBase with _$EditAccountStore;

abstract class _EditAccountStoreBase with Store {
  @observable
  late UserType userType;

  @action
  void setUserType(int? val) => UserType.values[val!];

  @observable
  String? name;

  @action
  void setName(String val) => name = val;

  @computed
  bool get nameValid => name != null && name!.length >= 6;

  @computed
  String? get nameError =>
      nameValid || name == null ? null : 'Campo obrigatório';

  @observable
  String? phone;

  @action
  void setPhone(String val) => phone = val;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;

  @computed
  String? get phoneError =>
      phoneValid || phone == null ? null : 'Campo obrigatório';

  @observable
  String pass1 = '';

  @action
  void setPass1(String val) => pass1 = val;

  @observable
  String pass2 = '';

  @action
  void setPass2(String val) => pass2 = val;

  @computed
  bool get passValid => pass1 == pass2 && (pass1.length >= 6 || pass1.isEmpty);

  @computed
  bool get formValid => nameValid && phoneValid && passValid;

  String? get passError {
    if (pass1.isNotEmpty && pass1.length < 6) {
      return 'Senhas muito curta';
    } else if (pass1 != pass2) {
      return 'Senhas não coincidem';
    } else {
      return null;
    }
  }
}
