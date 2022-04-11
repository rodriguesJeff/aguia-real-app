import 'package:aguia_real_dbv/src/shared/data/unity_repository.dart';
import 'package:aguia_real_dbv/src/shared/data/user_repository.dart';
import 'package:aguia_real_dbv/src/views/home_view.dart';
import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase(this.view);

  final HomeView view;

  @action
  void initApp() {
    getCurrentUser();
    getUnityes();
  }

  @observable
  bool isLoading = true;

  @observable
  UserRepository userRepository = UserRepository();
  UnityRepository unityRepository = UnityRepository();

  @observable
  ParseUser? currentUser;
  List<ParseObject> unityes = [];

  @action
  Future<void> getCurrentUser() async {
    currentUser = await userRepository.getCurrentUser();
    if (currentUser != null) {
      isLoading = false;
    }
  }

  @action
  Future<void> logout() async {
    await userRepository.logout();
    view.backToLoginPage();
  }

  @action
  Future<void> getUnityes() async {
    unityes = await unityRepository.getUnityes();
  }
}
