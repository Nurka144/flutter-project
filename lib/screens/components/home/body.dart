import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Color(0xFF979797).withOpacity(.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/Bell.svg"),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
