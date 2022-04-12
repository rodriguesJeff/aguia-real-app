import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
}
