import 'package:app_mobile_test/constants.dart';
import 'package:app_mobile_test/routes.dart';
import 'package:app_mobile_test/screens/Welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: routes,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: "Muli",
            primaryColor: kPrimaryColor,
            appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
            ),
            scaffoldBackgroundColor: Colors.white),
        home: WelcomeScreen());
  }
}
