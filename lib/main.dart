import 'package:aguia_real_dbv/src/modules/login/login_page.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  await Parse().initialize(
    Utils.keyApplicationId,
    Utils.keyParseServerUrl,
    clientKey: Utils.keyClientKey,
    autoSendSessionId: true,
  );
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}
