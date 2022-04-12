import 'package:aguia_real_dbv/src/views/splash_view.dart';
import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  _SplashControllerBase(this.view);

  final SplashView view;

  @action
  Future<void> initApp() async {
    await Future.delayed(const Duration(seconds: 4));
    await view.navToLoginPage();
  }
}
