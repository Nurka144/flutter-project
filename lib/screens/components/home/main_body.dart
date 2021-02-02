import 'package:app_mobile_test/components/drawer.dart';
import 'package:app_mobile_test/constants.dart';
import 'package:app_mobile_test/screens/QRSceen.dart';
import 'package:app_mobile_test/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_mobile_test/screens/components/home/body.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: DrawerContainer(),
      body: HomeBody(),
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: Container(
        child: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset(
              "assets/icons/menu.svg",
              height: SizeConfig.defaultSize * 2,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/scan.svg",
            height: SizeConfig.defaultSize * 2,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScanQRCode()),
            );
          },
        ),
        Center(
          child: Text(
            "Scan",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        )
      ],
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            onPressed: () => {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/add.svg'),
            onPressed: () => {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/user (1).svg'),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
