import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tubes_nguliks/app/modules/home/controllers/home_controller.dart';

class CustomAddButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color colour;
  final VoidCallback? onPress;

  const CustomAddButton({
    super.key,
    required this.text,
    required this.icon,
    required this.colour,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.white.withValues(green: 5),
        child: Ink(
          width: 380,
          height: 50,
          // height: 85,
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 10),
              Text(
                text,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
