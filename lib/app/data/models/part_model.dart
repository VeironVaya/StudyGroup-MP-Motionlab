import 'package:cloud_firestore/cloud_firestore.dart';

class Part {
  String id;
  String songId;
  String partType;
  String content;
  Timestamp createdAt;

  Part(
      {required this.id,
      required this.songId,
      required this.partType,
      required this.content,
      required this.createdAt});

  //Convert firebase document to Song object
  factory Part.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Part(
      id: doc.id,
      songId: data['songId'],
      partType: data['parType'],
      content: data['content'],
      createdAt: data['createdAt'],
    );
  }
  //Convert Song object to a Map (for firebase)
  Map<String, dynamic> toMap() {
    return {
      'songId': songId,
      'partType': partType,
      'content': content,
      'createdAt': createdAt,
    };
  }
}
