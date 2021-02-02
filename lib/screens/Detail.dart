import 'package:app_mobile_test/constants.dart';
import 'package:app_mobile_test/screens/components/detail/body.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static String routerName = '/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(),
      body: DetailBody(),
    );
  }
}
