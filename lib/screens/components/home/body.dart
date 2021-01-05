import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Container(
                  width: size.width * .6,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF979797).withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // поиск
                    },
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Поиск товаров",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Color(0xFF979797).withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
