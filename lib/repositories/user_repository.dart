import 'package:clone_olx/models/user.dart';
import 'package:clone_olx/repositories/parse_errors.dart';
import 'package:clone_olx/repositories/table_keys.dart';
import 'package:clone_olx/view_models/user_login_view_model.dart';
import 'package:clone_olx/view_models/user_signup_view_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepository {
  Future<User> signUp(UserSigupViewModel user) async {
    final parseUser = ParseUser(
      user.email,
      user.password,
      user.email,
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set<int>(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<User> loginWithEmail(UserLoginViewModel user) async {
    final parseUser = ParseUser(
      user.email,
      user.password,
      null,
    );

    final response = await parseUser.login();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<User?> currentUser() async {
    final parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);

      if (response != null && response.success) {
        return mapParseToUser(response.result);
      } else {
        await parseUser.logout();
      }
    }

    return null;
  }

  Future<void> save(User user) async {
    ParseUser? parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      parseUser.set<String>(keyUserName, user.name);
      parseUser.set<String>(keyUserPhone, user.phone);
      parseUser.set<int>(keyUserType, user.type.index);

      if (user.pass != null) {
        parseUser.password = user.pass;
      }

      final response = await parseUser.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      } else {
        if (user.pass != null) {
          await parseUser.logout();

          final loginResponse =
              await ParseUser(user.email, user.pass, user.email).login();

          if (!loginResponse.success) {
            return Future.error(
                ParseErrors.getDescription(loginResponse.error!.code));
          }
        }
      }
    }
  }

  Future<void> logout() async {
    final ParseUser currentUser = await ParseUser.currentUser();

    await currentUser.logout();
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId ?? '',
      name: parseUser.get(keyUserName) ?? '',
      email: parseUser.get(keyUserEmail) ?? '',
      phone: parseUser.get(keyUserPhone) ?? '',
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }
}
