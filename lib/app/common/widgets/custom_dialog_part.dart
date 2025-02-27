import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_general_button.dart';
import 'package:tubes_nguliks/app/modules/song/controllers/song_controller.dart';

import '../../modules/home/controllers/home_controller.dart';

class CustomDialogPart extends StatelessWidget {
  final Function? methD;
  final SongController songController;
  final String passedSongId;
  const CustomDialogPart(
      {super.key,
      required this.songController,
      required this.methD,
      required this.passedSongId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF2C2C2C),
      content: Container(
        height: 230,
        width: 380,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: songController.partTextController,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.white70,
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                hintText: "Song part? ex. Reff",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                CustomGeneralButton(
                    text: "Save",
                    colour: Color(0xFFFC4C02),
                    onPress: () {
                      methD!(passedSongId);
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
