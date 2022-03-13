import 'package:mobx/mobx.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String? name;

  @action
  void setName(String val) => name = val;

  @computed
  String? get nameError {
    if (name == null || name!.length > 6) {
      return null;
    } else if (name!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }
}
