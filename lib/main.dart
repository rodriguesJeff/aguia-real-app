import 'package:aguia_real_dbv/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
   runApp(
     GetMaterialApp(
       title: "Águia Real App",
       initialRoute: AppPages.INITIAL,
       getPages: AppPages.routes,
     ),
   );
}