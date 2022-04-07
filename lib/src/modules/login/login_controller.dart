import 'package:aguia_real_dbv/src/modules/login/login_repository.dart';
import 'package:aguia_real_dbv/src/views/login_view.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  _LoginControllerBase(this.view);

  final LoginView view;

  @observable
  LoginRepository repository = LoginRepository();

  @observable
  String username = "";
  String password = "";
  bool isLoading = false;

  @action
  void setUsername(String value) => username = value;

  @computed
  bool get isUserNameValid {
    if (username.isNotEmpty) return true;
    if (username.length > 5) return true;
    return false;
  }

  @computed
  String? get usernameMessage {
    if (isUserNameValid) return null;
    return 'USernamve inválido';
  }

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isPasswordValid {
    if (password.isNotEmpty) return true;
    if (password.length > 8) return true;
    return false;
  }

  @computed
  String? get passwordMessage {
    if (isPasswordValid) return null;
    return 'Senha inválida';
  }

  @computed
  get isFormValid => isUserNameValid && isPasswordValid ? login() : null;

  @action
  Future<void> login() async {
    isLoading = true;
    Future.delayed(const Duration(seconds: 1));
    final response = await repository.login(username, password);
    if (response.success) {
      isLoading = false;
      view.navToHomePage();
    }
  }
}
