import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_add_button.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_not_home_appbar.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_part_tile.dart';

import '../../../routes/app_pages.dart';

class SongView extends StatelessWidget {
  final String songTitle, songArtist;
  const SongView(
      {super.key, required this.songTitle, required this.songArtist});

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
              onPress: () {},
              colour: const Color(0xFFFC4C02),
              icon: Icons.add,
              text: "Add Part",
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: CustomPartTile(
                        onPress: () {
                          Get.toNamed(Routes.PART, arguments: {
                            'title': songTitle,
                          });
                        },
                        text: "Verse",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
