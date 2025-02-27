import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_add_button.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_appbar.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_song_tile.dart';
import 'package:tubes_nguliks/app/modules/home/controllers/home_controller.dart';
import '../../../common/widgets/custom_dialog_song.dart';
import '../../../routes/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    var box = Hive.box('authBox');

    String userEmail = box.get('userEmail', defaultValue: "No Email Found");
    String userName = box.get('userName', defaultValue: "No Name");

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppbar(
                onPress: () {
                  Get.toNamed(Routes.PROFILE);
                },
                firstLine: userName,
                secondLine: userEmail,
                imgDir: "img_profile_photo.png",
              ),
              CustomAddButton(
                colour: const Color(0xFF3B3B3B),
                icon: Icons.add,
                text: "Add Song",
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomDialogSong(homeController: homeController);
                    },
                  );
                },
              ),
              SizedBox(height: 10),
              StreamBuilder(
                stream: homeController.fetchSongs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        "No songs available",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return Column(
                    children: snapshot.data!.docs.map((document) {
                      return Column(
                        children: [
                          CustomSongTile(
                            id: document.id,
                            title: (document.data()
                                    as Map<String, dynamic>)?['title'] ??
                                "Unknown Title",
                            artist: (document.data()
                                    as Map<String, dynamic>)?['artist'] ??
                                "Unknown Artist",
                            onPress: () {},
                            onDelete: () =>
                                homeController.deleteSong(document.id),
                            onEdit: () =>
                                homeController.updateSong(document.id),
                          ),
                          SizedBox(height: 5), // Adds space after each tile
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


              // CustomSongTile(
              //     title: "Pergilah",
              //     artist: "Raisa",
              //     onPress: () {
              //       Get.toNamed(Routes.SONG);
              //     })