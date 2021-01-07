import 'package:app_mobile_test/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBody extends StatelessWidget {
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
            onPressed: () {},
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
    return Center(
      child: Text(
        'Home page',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
