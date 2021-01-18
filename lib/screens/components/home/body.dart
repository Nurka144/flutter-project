import 'package:app_mobile_test/screens/QRSceen.dart';
import 'package:app_mobile_test/screens/components/home/home-nav-tabs.dart';
import 'package:app_mobile_test/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key key}) : super(key: key);

  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
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

class Body extends StatelessWidget {
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
                      TextSpan(text: 'Добро пожаловать, Тузелбеков Нурбек!'),
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
                  BannerSlider(),
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

class BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
      ),
      child: SizedBox(
        width: 240,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/image_banner.png",
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: "Смартфон \n"),
                      TextSpan(text: "Модель: Samsung"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 35,
        left: 15,
        right: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            "Подробнее",
            style: TextStyle(
              color: Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}
