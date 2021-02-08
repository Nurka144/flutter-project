import 'package:app_mobile_test/components/rounded_button.dart';
import 'package:app_mobile_test/components/text_field_container.dart';
import 'package:flutter/material.dart';

class NewProductBody extends StatelessWidget {
  TextEditingController _productName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text(
              'Добавить товар',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextFieldContainer(
              child: TextField(
                controller: _productName,
                decoration: InputDecoration(
                  hintText: 'Введите название продукта',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: _productName,
                decoration: InputDecoration(
                  hintText: 'Введите описание',
                  border: InputBorder.none,
                ),
              ),
            ),
            RoundedButton(
              text: "Добавить",
              press: () async {},
            )
          ],
        ),
      ),
    );
  }
}
