import 'package:flutter/material.dart';

class DetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
