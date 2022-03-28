import 'package:clone_olx/models/address.dart';
import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/models/user.dart';

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
  });
}
