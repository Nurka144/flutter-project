import 'package:app_mobile_test/components/rounded_button.dart';
import 'package:app_mobile_test/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NewProductBody extends StatelessWidget {
  TextEditingController _productName = TextEditingController();
  TextEditingController _productDescription = TextEditingController();
  String productId = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: GenerateQRCode(),
    );
  }
}

class GenerateQRCode extends StatefulWidget {
  GenerateQRCode({Key key}) : super(key: key);

  @override
  _GenerateQRCodeState createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController _productName = TextEditingController();
  TextEditingController _productDescription = TextEditingController();
  String _productId = "";

  // void _handleTap() {
  //   setState(() {
  //     _active = !_active;
  //   });
  // }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
              controller: _productDescription,
              decoration: InputDecoration(
                hintText: 'Введите описание',
                border: InputBorder.none,
              ),
            ),
          ),
          RoundedButton(
            text: "Добавить",
            press: () async {
              await EasyLoading.show(
                status: 'Loading...',
                maskType: EasyLoadingMaskType.black,
              );
              var url = 'https://backapiapp.herokuapp.com/product';
              final response = await http.post(url, body: {
                'title': _productName.text,
                'description': _productDescription.text
              });
              final data = jsonDecode(response.body);
              setState(() {
                this._productId = data['_id'];
              });
              print(this._productId);
              EasyLoading.dismiss();
            },
          ),
          SizedBox(
            height: 30,
          ),
          BarcodeWidget(
            barcode: Barcode.qrCode(),
            color: Colors.black,
            data: _productId,
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}
