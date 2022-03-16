import 'package:clone_olx/models/user.dart';

class UserLoginViewModel {
  UserLoginViewModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;
}
