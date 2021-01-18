import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeNavTabs extends StatefulWidget {
  _HomeNavTabsState createState() => _HomeNavTabsState();
}

class _HomeNavTabsState extends State<HomeNavTabs> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categorys = [
      {"icon": "assets/icons/flash.svg", "text": "Главная"},
      {"icon": "assets/icons/flash.svg", "text": "Главная"},
      {"icon": "assets/icons/flash.svg", "text": "Главная"},
      {"icon": "assets/icons/flash.svg", "text": "Главная"},
      {"icon": "assets/icons/flash.svg", "text": "Главная"}
    ];
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
              categorys.length,
              (index) => SizedBox(
                width: 55,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFECDF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset(categorys[index]["icon"]),
                          onPressed: () => print(index),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categorys[index]["text"],
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
