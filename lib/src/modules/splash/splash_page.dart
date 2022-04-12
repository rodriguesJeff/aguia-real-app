import 'package:aguia_real_dbv/src/modules/login/login_page.dart';
import 'package:aguia_real_dbv/src/modules/splash/splash_controller.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:aguia_real_dbv/src/views/splash_view.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> implements SplashView {
  late SplashController controller;

  @override
  void initState() {
    controller = SplashController(this);
    controller.initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Center(child: Image.asset('assets/video/presentation.gif')),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'DSA + UNeB + APeC + REGIÃO 3 + 44 DISTRITO\nIASD COHAB I / BELO JARDIM/PE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 9.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  navToLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }
}
