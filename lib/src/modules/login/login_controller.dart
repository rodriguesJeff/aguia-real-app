import 'package:aguia_real_dbv/src/modules/login/login_repository.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController  extends GetxController {
  final LoginRepository repository;

  LoginController({required this.repository});

  String username = "";
  void setUsername(String value) => username = value;
  bool get isUserNameValid {
    if (username.isNotEmpty) return true;
    if (username.length > 5) return true;
    return false;
  }
  String? get usernameMessage {
    if (isUserNameValid) return null;
    return 'USernamve inválido';
  }

  String password = "";
  void setPassword(String value) => password = value;
  bool get isPasswordValid {
    if (password.isNotEmpty) return true;
    if (password.length > 8) return true;
    return false;
  }
  String? get passwordMessage {
    if (isPasswordValid) return null;
    return 'Senha inválida';
  }

  get isFormValid => isUserNameValid && isPasswordValid ? login() : null;

  bool isLoading = false;

  Future<void> login() async {
    isLoading = true;
    final response = await repository.login(username, password);

    if (response.success) {
      print(response.result);
    }
    print(response.statusCode);
  }
}