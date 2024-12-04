import 'package:flutter/material.dart';

class CustomTextFieldUtil extends StatelessWidget {
  String? hintText;
  CustomTextFieldUtil({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
