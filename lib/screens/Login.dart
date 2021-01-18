import 'package:app_mobile_test/screens/components/login/body.dart';
import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  static String routerName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}
