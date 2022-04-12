import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @action
  Future<void> initApp() async {
    Future.delayed(const Duration(seconds: 6));
  }
}
