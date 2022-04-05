import 'package:aguia_real_dbv/src/shared/data/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  bool isLoading = true;

  @observable
  UserRepository userRepository = UserRepository();

  @observable
  ParseUser? currentUser;

  @action
  Future<void> getCurrentUser() async {
    currentUser = await userRepository.getCurrentUser();
    if (currentUser != null) {
      isLoading = false;
    }
  }
}
