import 'package:app_mobile_test/constants.dart';
import 'package:app_mobile_test/routes.dart';
import 'package:app_mobile_test/screens/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('ru', '')],
      path: 'lang',
      fallbackLocale: Locale('ru', ''),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
      home: WelcomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
