import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_not_home_appbar.dart';
import 'package:tubes_nguliks/app/modules/part/controllers/part_controller.dart';
import 'package:tubes_nguliks/app/data/models/part_model.dart';

class PartView extends StatefulWidget {
  final String songTitle;
  final String songPart;
  final String partId; // The ID of the part to edit

  const PartView({
    super.key,
    required this.songTitle,
    required this.songPart,
    required this.partId,
  });

  @override
  PartViewState createState() => PartViewState();
}

class PartViewState extends State<PartView> {
  final PartController partController = Get.find<PartController>();
  final TextEditingController contentController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPartContent();
  }

  Future<void> loadPartContent() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('parts')
          .doc(widget.partId)
          .get();

      if (doc.exists && doc.data() != null) {
        setState(() {
          contentController.text =
              doc['content'] ?? ''; // Load existing content
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false; // Stop loading if no document is found
        });
        Get.snackbar("Error", "Part not found!",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Get.snackbar("Error", "Failed to load content: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  /// Save the updated content to Firestore when user stops typing
  Future<void> saveContent() async {
    await FirebaseFirestore.instance
        .collection('parts')
        .doc(widget.partId)
        .update({'content': contentController.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            CustomNotHomeAppbar(
              firstLine: widget.songTitle,
              secondLineDesc: "~",
              secondLine: widget.songPart,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.93,
                child: isLoading
                    ? Center(
                        child:
                            CircularProgressIndicator()) // Show loading state
                    : TextFormField(
                        controller: contentController,
                        style: GoogleFonts.libreBaskerville(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              "Your music notes ex.\nDo = Eb\nGuitar:\nI - IV - vi - V - IV\nKeyboard:\nI - I - I - V - IV",
                          hintStyle: GoogleFonts.libreBaskerville(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white70,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (text) =>
                            saveContent(), // Save on text change
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
