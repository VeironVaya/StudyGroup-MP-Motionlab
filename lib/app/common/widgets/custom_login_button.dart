import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  final Color colour;
  const CustomLoginButton({
    super.key,
    required this.text,
    required this.colour,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white.withValues(green: 5),
        borderRadius: BorderRadius.circular(10),
        onTap: onPress,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: 380,
          height: 65,
          decoration: BoxDecoration(
            color: const Color(0xFF3B3B3B),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
              ),
              Image.asset(
                'assets/images/google_logo.png',
                height: 24, // Increased size
                width: 24,
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    // Apply Google Fonts Roboto
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
