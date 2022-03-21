import 'package:clone_olx/models/address.dart';
import 'package:clone_olx/models/city.dart';
import 'package:clone_olx/repositories/ibge_repository.dart';
import 'package:dio/dio.dart';

class CepRepository {
  Future<Address> getAddressFromApi(String cep) async {
    if (cep.isEmpty) {
      return Future.error('CEP Inválido');
    }

    final clearCep = cep.replaceAll(RegExp('[^0-9]'), '');

    if (clearCep.length != 8) {
      return Future.error('CEP Inválido');
    }

    final endpoint = 'https://viacep.com.br/ws/$clearCep/json';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data!.containsKey('erro') && response.data!['erro']) {
        return Future.error('CEP Inválido');
      }

      final ufList = await IBGERepository().getUFList();

      return Address(
        uf: ufList.firstWhere((uf) => uf.sigla == response.data!['uf']),
        city: City(nome: response.data!['localidade']),
        cep: response.data!['cep'],
        district: response.data!['bairro'],
      );
    } catch (e) {
      return Future.error('Falha ao buscar CEP');
    }
  }
}
