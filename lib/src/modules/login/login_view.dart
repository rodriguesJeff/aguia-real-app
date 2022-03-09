import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                              color: Utils.darkBlue),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(                       
                          decoration: InputDecoration(                          
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.person, color: Utils.greyDark, size: 40,),
                            ),
                            hintText: 'Informe seu Email',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Utils.darkBlue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(                          
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.lock, color: Utils.greyDark, size: 40,),
                            ),
                            hintText: 'Senha',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Utils.darkBlue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text('Esqueceu a senha?', style: TextStyle(fontSize: 10.0, color: Utils.greyMid)),
                        ),
                        GestureDetector(
                          onTap: () {Get.toNamed('/home');},
                          child: Container(
                            width: 300.0,
                            height: 55.0,
                            decoration: BoxDecoration(
                              color: Utils.greenAction,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Center(child: Text('ENTRAR', style: TextStyle(color: Colors.white, fontSize: 20.0))),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Divider(height: 6, color: Utils.greyDark),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {Get.toNamed('/register');},
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
                            child: Center(child: Text('CADASTRAR', style: TextStyle(color: Utils.darkBlue, fontSize: 20.0))),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}