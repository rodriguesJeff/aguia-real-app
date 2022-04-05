import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepository {
  Future<ParseUser?> getCurrentUser() async {
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    if (currentUser == null) {
      return null;
    }

    final ParseResponse? parseResponse =
        await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);

    if (parseResponse?.success == null || !parseResponse!.success) {
      await currentUser.logout();
      return null;
    } else {
      return currentUser;
    }
  }
}
