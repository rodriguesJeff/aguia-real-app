import 'package:aguia_real_dbv/src/modules/home/home_view.dart';
import 'package:aguia_real_dbv/src/modules/login/login_view.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(name: _Paths.home, page: () => HomeView()),
    GetPage(name: _Paths.login, page: () => LoginView()),
  ];
}