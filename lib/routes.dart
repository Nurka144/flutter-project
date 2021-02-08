import 'package:app_mobile_test/screens/Detail.dart';
import 'package:app_mobile_test/screens/Home.dart';
import 'package:app_mobile_test/screens/Login.dart';
import 'package:app_mobile_test/screens/NewProduct.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routerName: (context) => HomeScreen(),
  LoginScreen.routerName: (context) => LoginScreen(),
  DetailScreen.routerName: (context) => DetailScreen(),
  NewProductScreen.routerName: (context) => NewProductScreen()
};
