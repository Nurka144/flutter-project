import 'package:app_mobile_test/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordFiled extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordFiled({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          hintText: "Введите пароль",
          border: InputBorder.none,
          suffixIcon: Icon(Icons.visibility),
        ),
      ),
    );
  }
}
