import 'package:app_mobile_test/components/drawer.dart';
import 'package:app_mobile_test/screens/QRSceen.dart';
import 'package:app_mobile_test/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_mobile_test/screens/components/home/homebody.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key key}) : super(key: key);

  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: DrawerContainer(),
      body: Body(),
      appBar: AppBar(
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
      ),
    );
  }
}
