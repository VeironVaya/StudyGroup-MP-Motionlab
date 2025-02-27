import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPartTile extends StatelessWidget {
  final String text;
  const CustomPartTile({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.white.withValues(green: 5),
        child: Ink(
          width: 380,
          height: 85,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 10),
              Text(
                text,
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.white70,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
