import 'package:aguia_real_dbv/src/modules/login/login_controller.dart';
import 'package:aguia_real_dbv/src/modules/login/login_repository.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override 
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(repository: LoginRepository());
    });
  }
}