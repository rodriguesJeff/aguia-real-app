import 'package:aguia_real_dbv/src/modules/home/home_page.dart';
import 'package:aguia_real_dbv/src/modules/login/login_controller.dart';
import 'package:aguia_real_dbv/src/modules/ranking/show_unity_ranking.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:aguia_real_dbv/src/views/login_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginView {
  late LoginController controller;
  @override
  void initState() {
    controller = LoginController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Utils.darkBlue,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        initialValue: controller.username,
                        onChanged: controller.setUsername,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.person,
                              color: Utils.greyDark,
                              size: 40,
                            ),
                          ),
                          hintText: 'Informe seu username',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Utils.darkBlue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        onChanged: controller.setPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.lock,
                              color: Utils.greyDark,
                              size: 40,
                            ),
                          ),
                          hintText: 'Senha',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Utils.darkBlue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Text('Esqueceu a senha?',
                            style: TextStyle(
                                fontSize: 10.0, color: Utils.greyMid)),
                      ),
                      Observer(builder: (_) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Utils.greenAction),
                          onPressed: () async {
                            controller.isFormValid;
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: controller.isLoading
                                  ? LoadingAnimationWidget.inkDrop(
                                      color: Colors.white,
                                      size: 20,
                                    )
                                  : const Text(
                                      'ENTRAR',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 10.0),
                      Divider(height: 6, color: Utils.greyDark),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ShowUnityRanking(),
                          ),
                        ),
                        child: Container(
                          width: 300.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Utils.darkBlue,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              'ACOMPANHAR PONTUAÇÃO',
                              style: TextStyle(
                                color: Utils.darkBlue,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void navToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
