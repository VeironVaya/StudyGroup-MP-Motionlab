import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNotHomeAppbar extends StatelessWidget {
  final String firstLine, secondLine;
  const CustomNotHomeAppbar(
      {super.key, required this.firstLine, required this.secondLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kToolbarHeight + 20,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color(0xFF121212),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Title: $firstLine",
                style: GoogleFonts.roboto(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                "Artist: $secondLine",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
