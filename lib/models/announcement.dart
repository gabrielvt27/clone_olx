import 'package:clone_olx/models/address.dart';
import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/models/city.dart';
import 'package:clone_olx/models/uf.dart';
import 'package:clone_olx/models/user.dart';
import 'package:clone_olx/repositories/table_keys.dart';
import 'package:clone_olx/repositories/user_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

enum AnnouncementStatus { pending, active, sold, deleted }

class Announcement {
  String id;
  List images;
  String title;
  String description;
  Category category;
  Address address;
  num price;
  bool hidePhone;
  User user;
  int views;
  DateTime createAt;
  AnnouncementStatus status = AnnouncementStatus.pending;

  Announcement({
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.category,
    required this.address,
    required this.price,
    required this.hidePhone,
    required this.user,
    required this.createAt,
    required this.views,
    status,
  });

  factory Announcement.fromParse(ParseObject object) {
    return Announcement(
      id: object.objectId!,
      images: object.get<List>(keyAdImages)!,
      title: object.get<String>(keyAdTitle)!,
      description: object.get<String>(keyAdDescription)!,
      category: Category.fromParse(object.get<ParseObject>(keyAdCategory)!),
      address: Address(
        district: object.get<String>(keyAdDistrict)!,
        city: City(nome: object.get<String>(keyAdCity)!),
        cep: object.get<String>(keyAdPostalCode)!,
        uf: UF(sigla: object.get<String>(keyAdFederativeUnit)!),
      ),
      price: object.get<num>(keyAdPrice)!,
      hidePhone: object.get<bool>(keyAdHidePhone)!,
      user: UserRepository().mapParseToUser(object.get<ParseUser>(keyAdOwner)!),
      createAt: object.createdAt!,
      views: object.get<int>(keyAdViews) ?? 0,
      status: AnnouncementStatus.values[object.get<int>(keyAdStatus)!],
    );
  }
}
