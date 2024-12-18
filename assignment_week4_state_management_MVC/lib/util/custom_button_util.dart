import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonUtil extends StatelessWidget {
  final String label;
  final Function()? function;
  CustomButtonUtil({super.key, required this.label, this.function});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: function,
        splashColor: Colors.white.withOpacity(0.3),
        highlightColor: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 55,
          width: 381,
          decoration: BoxDecoration(
            color: Color(0xFF00623B),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
