import 'package:aguia_real_dbv/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  const keyApplicationId = 'jXdxnm1PMnbOruQtYJ32P1GIKrsmx21pHb0l5VUz';
  const keyClientKey = 'bEKZ5qDzNpmXwYijfMrCgjbgoof10PAFTI5Y6Ojy';
  const keyParseServerUrl = 'https://parseapi.back4app.com';
  await Parse().initialize(
    keyApplicationId, 
    keyParseServerUrl,
    clientKey: keyClientKey, 
    autoSendSessionId: true
  );
  runApp(
    GetMaterialApp(
      title: "Águia Real App",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}