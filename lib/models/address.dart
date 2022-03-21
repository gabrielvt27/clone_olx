import 'package:clone_olx/models/city.dart';
import 'package:clone_olx/models/uf.dart';

class Address {
  UF uf;
  City city;
  String cep;
  String district;

  Address({
    required this.uf,
    required this.city,
    required this.cep,
    required this.district,
  });

  @override
  String toString() {
    return 'Address:{$uf, $city, cep: $cep, district: $district}';
  }
}
