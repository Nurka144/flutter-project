import 'dart:convert';

import 'package:app_mobile_test/components/rounded_button.dart';
import 'package:app_mobile_test/components/text_field_container.dart';
import 'package:app_mobile_test/screens/Home.dart';
import 'package:app_mobile_test/screens/components/login/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key key}) : super(key: key);

  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool data = true;
  bool loading = false;
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
              controller: _emailController,
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
              controller: _passwordController,
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
            press: () async {
              await EasyLoading.show(
                status: 'Loading...',
                maskType: EasyLoadingMaskType.black,
              );
              await LoginUser(_emailController, _passwordController, context);
            },
          )
        ],
      ),
    ));
  }
}

Future<void> LoginUser(email, password, context) async {
  List<String> errors = [];
  if (email.text == '') {
    errors.add('Введите email');
  }
  if (password.text == '') {
    errors.add('Введите пароль');
  }
  if (errors.length > 0) {
    SweetAlert.show(
      context,
      title: 'Ошибка',
      subtitle: errors.join('\n'),
      style: SweetAlertStyle.error,
    );
    return;
  }
  var url = 'https://backapiapp.herokuapp.com/auth/login';
  final response = await http
      .post(url, body: {'email': email.text, 'password': password.text});
  final data = jsonDecode(response.body);
  EasyLoading.dismiss();
  if (response.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', data['token']);
    print(data['token']);
    Navigator.pushNamed(context, HomeScreen.routerName);
  } else {
    SweetAlert.show(
      context,
      title: 'Ошибка',
      subtitle: data['message'],
      style: SweetAlertStyle.error,
    );
    return;
  }
}
