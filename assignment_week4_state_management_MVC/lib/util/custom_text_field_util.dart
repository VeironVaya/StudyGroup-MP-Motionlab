import 'package:flutter/material.dart';

class CustomTextFieldUtil extends StatelessWidget {
  String? hintText;
  IconData? icon;
  CustomTextFieldUtil({super.key, this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 381,
      height: 55,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Color(0xFF344E41),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFF344E41),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF344E41),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF344E41),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
