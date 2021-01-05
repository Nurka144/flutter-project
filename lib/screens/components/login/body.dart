import 'package:app_mobile_test/components/rounded_button.dart';
import 'package:app_mobile_test/components/text_field_container.dart';
import 'package:app_mobile_test/screens/Home.dart';
import 'package:app_mobile_test/screens/components/login/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key key}) : super(key: key);

  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool data = true;

  void _seePassword() {
    setState(() {
      data = !data;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundLogin(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Вход в систему",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: size.height * .05,
          ),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.4,
          ),
          TextFieldContainer(
            child: TextField(
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Введите email",
                border: InputBorder.none,
              ),
            ),
          ),
          TextFieldContainer(
            child: TextField(
              obscureText: data,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: "Введите пароль",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: _seePassword,
                  icon: Icon(Icons.visibility),
                ),
              ),
            ),
          ),
          RoundedButton(
            text: "Войти",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routerName);
            },
          )
        ],
      ),
    ));
  }
}
