import 'package:app_mobile_test/screens/components/home/bannser-sliter.dart';
import 'package:app_mobile_test/screens/components/home/home-nav-tabs.dart';
import 'package:app_mobile_test/screens/components/home/sectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String tokenUser = "";

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    setState(() {
      tokenUser = token;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getToken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 35),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF4A3298),
              ),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: double.infinity,
                    child: Text.rich(
                      TextSpan(text: tokenUser),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 31,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  )
                ],
              ),
            ),
            HomeNavTabs(),
            SectionTitle(
              text: "Последние просмотренные",
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BannerSlider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
