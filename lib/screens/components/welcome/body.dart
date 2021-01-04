import 'dart:ui';

import 'package:app_mobile_test/screens/components/welcome/background.dart';
import 'package:app_mobile_test/components/rounded_button.dart';
import 'package:app_mobile_test/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Добро пожаловать",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(
          height: size.height * 0.08,
        ),
        SvgPicture.asset(
          "assets/icons/chat.svg",
          height: size.height * 0.4,
        ),
        SizedBox(
          height: size.height * 0.08,
        ),
        RoundedButton(
          text: 'Войти в систему',
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }));
          },
        )
      ],
    )));
  }
}
