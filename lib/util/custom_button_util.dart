import 'package:flutter/material.dart';

class CustomButtonUtil extends StatelessWidget {
  final String label;
  CustomButtonUtil({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 381,
      child: Text(label),
      color: Color(0xFF00623B),
    );
  }
}
