import 'package:clone_olx/models/address.dart';
import 'package:clone_olx/repositories/cep_repository.dart';
import 'package:mobx/mobx.dart';
part 'cep_store.g.dart';

class CepStore = _CepStoreBase with _$CepStore;

abstract class _CepStoreBase with Store {
  _CepStoreBase(String? initialCep) {
    autorun((_) {
      if (clearCep.length != 8) {
        _reset();
      } else {
        _searchCep();
      }

      if (initialCep != null) {
        setCep(initialCep);
      }
    });
  }

  @observable
  String cep = '';

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Address? address;

  @observable
  String? error;

  @observable
  bool loading = false;

  @action
  Future<void> _searchCep() async {
    loading = true;
    try {
      address = await CepRepository().getAddressFromApi(clearCep);
      error = null;
    } catch (e) {
      error = e.toString();
      address = null;
    }
    loading = false;
  }

  @action
  void _reset() {
    address = null;
    error = null;
  }
}
