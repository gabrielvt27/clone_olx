import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  runApp(const MyApp());

  await Parse().initialize(
    'obje0rG4oYWBE7QUzNiXquPqW8S817IijhiVcvMi',
    'https://parseapi.back4app.com/',
    clientKey: 'JDDGsyjLeLbv9zVkdL2wR5oHDdf0WevNzbuOnlLG',
    autoSendSessionId: true,
    debug: true,
  );

  // Cria um objeto(linha) na classe(tabela)
  // Title e Position são colunas dessa classe(tabela)
  // final category = ParseObject('Categories')
  //   ..set<String>('Title', 'Meias')
  //   ..set<int>('Position', 1);

  // final response = await category.save();

  // print(response.success);

  // Atualizar um objeto(linha) na classe(tabela)
  // final category = ParseObject('Categories')
  //   ..objectId = 'Nohq7o1rDX'
  //   ..set<int>('Position', 3);

  // final response = await category.save();

  // print(response.success);

  // Deletar um objeto(linha) na classe(tabela)
  // final category = ParseObject('Categories')
  //   ..objectId = 'Nohq7o1rDX'
  //   ..delete();

  // final response = await category.save();

  // print(response.success);

  // Retorna um objeto(linha) pelo seu ID
  // final response = await ParseObject('Categories').getObject('WpwHEwfD28');

  // if (response.success) print(response.result);

  // Retorna todos os objetos(linhas) de uma classe(tabela)
  // final response = await ParseObject('Categories').getAll();
  // if (response.success) {
  //   for (final object in response.result) {
  //     print(object);
  //   }
  // }

  // Consulta na classe(tabela) onde a coluna Position é igual a 2
  // final query = QueryBuilder(ParseObject('Categories'));

  // query.whereEqualTo('Position', 2);

  // final response = await query.query();

  // if (response.success) print(response.result);

  // Consulta na classe(tabela) onde a coluna Position é igual a 2 e a coluna Title contenha a palavra 'Blusas'
  // final query = QueryBuilder(ParseObject('Categories'));

  // query.whereContains('Title', 'Blusas');
  // query.whereEqualTo('Position', 2);

  // final response = await query.query();

  // if (response.success) print(response.result);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
