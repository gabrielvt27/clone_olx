import 'package:clone_olx/models/address.dart';
import 'package:clone_olx/models/announcement.dart';
import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/models/user.dart';

class AnnouncementViewModel {
  String? id;
  List images;
  String title;
  String description;
  Category category;
  Address address;
  num price;
  bool hidePhone;
  User user;
  AnnouncementStatus status;

  AnnouncementViewModel({
    required this.images,
    required this.title,
    required this.description,
    required this.category,
    required this.address,
    required this.price,
    required this.hidePhone,
    required this.user,
    this.status = AnnouncementStatus.pending,
    this.id,
  });
}
