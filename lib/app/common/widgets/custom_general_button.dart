// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGeneralButton extends StatelessWidget {
  final String text;
  final Color colour;
  VoidCallback onPress;
  CustomGeneralButton(
      {super.key,
      required this.text,
      required this.onPress,
      required this.colour});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
      color: colour,
    );
  }
}
