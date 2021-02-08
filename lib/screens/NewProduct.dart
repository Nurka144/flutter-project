import 'package:app_mobile_test/constants.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile_test/screens/components/newproduct/body.dart';

class NewProductScreen extends StatelessWidget {
  static String routerName = "/newproduct";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(),
      body: NewProductBody(),
    );
  }
}
