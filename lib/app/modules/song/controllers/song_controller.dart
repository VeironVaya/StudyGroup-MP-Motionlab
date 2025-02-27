import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tubes_nguliks/app/data/models/part_model.dart';

class SongController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  var songs = <Part>[].obs;
  final partTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    fetchParts();
  }

  Stream<QuerySnapshot> fetchParts() {
    return db
        .collection('parts')
        .orderBy('createdAt', descending: false)
        .snapshots();
  }

  void handleCreatePart(String songId) async {
    final newPart = {
      'partType': partTextController.text,
      'content': "",
      'songId': songId,
      'createdAt': Timestamp.now(),
    };

    try {
      await db.collection('parts').add(newPart);
      partTextController.clear();
    } catch (e) {
      print("Error adding song: $e");
    }
  }

  void deletePart(String id) async {
    final db = FirebaseFirestore.instance;
    await db.collection('parts').doc(id).delete();
  }
}
