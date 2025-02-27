import 'package:cloud_firestore/cloud_firestore.dart';

class Song {
  String id;
  String title;
  String artist;
  Timestamp createdAt;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.createdAt,
  });

  //Convert firebase document to Song object
  factory Song.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Song(
      id: doc.id,
      title: data['title'],
      artist: data['artist'],
      createdAt: data['createdAt'],
    );
  }

  //Convert Song object to a Map (for firebase)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'artist': artist,
      'createdAt': createdAt,
    };
  }
}
