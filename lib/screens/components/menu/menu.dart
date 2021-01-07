import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.amberAccent,
          ),
        ),
        Container(
          width: 35,
          height: 110,
        )
      ],
    );
  }
}
