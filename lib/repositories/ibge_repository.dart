import 'dart:convert';

import 'package:clone_olx/models/city.dart';
import 'package:clone_olx/models/uf.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IBGERepository {
  Future<List<UF>> getUFList() async {
    final preferences = await SharedPreferences.getInstance();

    String? ufListCache = preferences.getString('UF_LIST');

    if (ufListCache != null) {
      final ufList = (json.decode(ufListCache)) as List;

      return ufList.map<UF>((uf) => UF.fromJson(uf)).toList();
    } else {
      try {
        String endpoint =
            'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

        final response = await Dio().get<List>(endpoint);

        preferences.setString('UF_LIST', json.encode(response.data));

        return response.data!.map<UF>((uf) => UF.fromJson(uf)).toList()
          ..sort(
              (a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
      } on DioError {
        return Future.error('Falha ao obter lista de estados');
      }
    }
  }

  Future<List<City>> getCityListFromApi(UF uf) async {
    try {
      String endpoint =
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/distritos';

      final response = await Dio().get<List>(endpoint);

      return response.data!.map<City>((uf) => City.fromJson(uf)).toList()
        ..sort((a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
    } on DioError {
      return Future.error('Falha ao obter lista de cidades');
    }
  }
}
