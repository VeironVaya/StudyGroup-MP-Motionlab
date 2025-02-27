import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_not_home_appbar.dart';
import 'package:tubes_nguliks/app/modules/part/controllers/part_controller.dart';

class PartView extends StatelessWidget {
  final String songTitle;
  const PartView({super.key, required this.songTitle});

  @override
  Widget build(BuildContext context) {
    final PartController partController =
        Get.find<PartController>(); // Ensure this controller is initialized

    return Scaffold(
      resizeToAvoidBottomInset: true, // Fix keyboard issue
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            CustomNotHomeAppbar(
              firstLine: songTitle,
              secondLineDesc: "~",
              secondLine: "Verse",
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.93,
                child: TextFormField(
                  controller: partController.partTextController,
                  focusNode: FocusNode(),
                  autofocus: true,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your Story",
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
