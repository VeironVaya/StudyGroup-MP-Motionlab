import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  final String firstLine, secondLine, imgDir, userPhoto;
  final VoidCallback onPress;
  const CustomAppbar({
    super.key,
    required this.firstLine,
    required this.secondLine,
    required this.imgDir,
    required this.onPress,
    required this.userPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        splashColor: Colors.white.withValues(green: 5),
        child: Ink(
          width: double.infinity,
          height: kToolbarHeight + 20,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: const Color(0xFF121212),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/img_logo.png',
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    firstLine,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    secondLine,
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
        ),
      ),
    );
  }
}
