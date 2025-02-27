import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_add_button.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_dialog_part.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_not_home_appbar.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_part_tile.dart';
import 'package:tubes_nguliks/app/modules/song/controllers/song_controller.dart';

import '../../../routes/app_pages.dart';

class SongView extends StatelessWidget {
  final String songTitle, songArtist, songId;
  final SongController songController = Get.find<SongController>();
  SongView(
      {super.key,
      required this.songTitle,
      required this.songArtist,
      required this.songId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            CustomNotHomeAppbar(
              firstLine: songTitle,
              secondLineDesc: "By",
              secondLine: songArtist,
            ),
            CustomAddButton(
              onPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialogPart(
                        songController: songController,
                        passedSongId: songId,
                        methD: songController.handleCreatePart);
                  },
                );
              },
              colour: const Color(0xFFFC4C02),
              icon: Icons.add,
              text: "Add Part",
            ),
            SizedBox(height: 10),
            StreamBuilder(
              stream: songController.fetchParts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      "No parts available",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                // Filter parts that match the current songId
                final filteredParts = snapshot.data!.docs
                    .where((document) =>
                        (document.data() as Map<String, dynamic>)['songId'] ==
                        songId)
                    .toList();

                // If no parts match, show "No parts available"
                if (filteredParts.isEmpty) {
                  return Center(
                    child: Text(
                      "Looks like there's no parts available, Try to add some 😊",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return Column(
                  children: snapshot.data!.docs
                      .where((document) =>
                          (document.data() as Map<String, dynamic>)['songId'] ==
                          songId)
                      .map((document) {
                    return Column(
                      children: [
                        CustomPartTile(
                          id: document.id,
                          songId: songId,
                          text: (document.data()
                                  as Map<String, dynamic>)?['partType'] ??
                              "Unknown TYpe",
                          onPress: () {
                            Get.toNamed(Routes.PART, arguments: {
                              'title': songTitle,
                              'songPart': (document.data()
                                      as Map<String, dynamic>)?['partType'] ??
                                  "Unknown TYpe",
                              'partId': document.id,
                            });
                          },
                          onDelete: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Color(0xFF2C2C2C),
                                title: Text(
                                  "Confirm Deletion",
                                  style: GoogleFonts.roboto(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                content: Text(
                                  "Are you sure you want to delete this song?",
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      songController.deletePart(document.id);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 5),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
