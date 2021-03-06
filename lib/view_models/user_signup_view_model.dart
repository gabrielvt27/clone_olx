import 'package:clone_olx/models/user.dart';

class UserSigupViewModel {
  UserSigupViewModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.type = UserType.particular,
  });

  String name;
  String email;
  String phone;
  String password;
  UserType type;
}
