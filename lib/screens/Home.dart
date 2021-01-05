import 'package:app_mobile_test/screens/components/home/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}
