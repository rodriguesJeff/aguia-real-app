import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


class LoginRepository {
  Future<ParseResponse> login(String username, String password) async {
    final user = ParseUser(username, password, null);

    return user.login();
  }
}