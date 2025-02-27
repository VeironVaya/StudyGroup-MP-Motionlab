import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_general_button.dart';

import '../../modules/home/controllers/home_controller.dart';

class CustomDialogSong extends StatelessWidget {
  final Function? methD;
  final HomeController homeController;
  const CustomDialogSong(
      {super.key, required this.homeController, required this.methD});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF2C2C2C),
      content: Container(
        height: 300,
        width: 380,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Title Input
            TextField(
              controller: homeController.titleTextController,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.white70,
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                hintText: "Song title? ex. Songbird",
                hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // White border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0), // White border when focused
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: homeController.artistTextController,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.white70,
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                hintText: "Artist? ex. Kenny G",
                hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // White border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0), // White border when focused
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                CustomGeneralButton(
                    text: "Save",
                    colour: Color(0xFFFC4C02),
                    onPress: () {
                      methD!();
                      Navigator.of(context).pop();
                    }),
                SizedBox(width: 8),
                //cancel
                CustomGeneralButton(
                    text: "Cancel",
                    colour: Color(0xFF757575),
                    onPress: () {
                      Navigator.of(context).pop();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
