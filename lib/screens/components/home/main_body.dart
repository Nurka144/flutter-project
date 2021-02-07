import 'package:app_mobile_test/components/drawer.dart';
import 'package:app_mobile_test/constants.dart';
import 'package:app_mobile_test/screens/components/detail/body.dart';
import 'package:app_mobile_test/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_mobile_test/screens/components/home/body.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dataQR = "";

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
            scanQrCode();
          },
        ),
        Center(
          child: Text(
            "Сконировать",
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

  Future<void> scanQrCode() async {
    try {
      final dataQR = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Отмена',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.dataQR = dataQR;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailBody(
              dataProduct: dataQR,
            ),
          ),
        );
      });
    } on PlatformException {
      dataQR = 'Failed to get platform version.';
    }
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
            icon: Icon(Icons.home),
            onPressed: () => {},
            iconSize: 35,
          ),
          IconButton(
            icon: Icon(Icons.control_point),
            onPressed: () => {},
            iconSize: 35,
          ),
          IconButton(
            icon: Icon(Icons.account_circle_outlined),
            onPressed: () => {},
            iconSize: 35,
          ),
        ],
      ),
    );
  }
}
