import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_dialog_song.dart';
import '../../../data/models/song_model.dart';

class HomeController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  var songs = <Song>[].obs;
  final titleTextController = TextEditingController();

  final artistTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchSongs();
  }

  Stream<QuerySnapshot> fetchSongs() {
    return db
        .collection('songs')
        .orderBy('createdAt', descending: false)
        .snapshots();
  }

  void handleCreateSong() async {
    final newSong = {
      'title': titleTextController.text,
      'artist': artistTextController.text,
      'createdAt': Timestamp.now(),
    };

    try {
      await db.collection('songs').add(newSong);
      titleTextController.clear();
      artistTextController.clear();
    } catch (e) {
      print("Error adding song: $e");
    }
  }

  void deleteSong(String id) async {
    final db = FirebaseFirestore.instance;
    await db.collection('songs').doc(id).delete();
  }

  void updateSong(String id) async {
    final updatedSong = {
      'title': titleTextController.text,
      'artist': artistTextController.text,
    };
    final db = FirebaseFirestore.instance;
    await db.collection('songs').doc(id).update(updatedSong);
    titleTextController.clear();
    artistTextController.clear();
  }
}
