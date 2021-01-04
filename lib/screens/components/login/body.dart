import 'package:app_mobile_test/components/rounded_button.dart';
import 'package:app_mobile_test/components/rounded_input_field.dart';
import 'package:app_mobile_test/components/rounded_password_filed.dart';
import 'package:app_mobile_test/screens/components/login/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key key}) : super(key: key);
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
          RoundedInputField(
            hintText: "Введите email",
            icon: Icons.person,
            onChanged: (value) => {},
          ),
          RoundedPasswordFiled(
            onChanged: (value) => {},
          ),
          RoundedButton(
            text: "Войти",
            press: () {},
          )
        ],
      ),
    ));
  }
}
