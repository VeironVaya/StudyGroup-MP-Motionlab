import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_add_button.dart';
import 'package:tubes_nguliks/app/modules/profile/controllers/profile_controller.dart';
import '../../../routes/app_pages.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController logoutController = Get.find();
    var box = Hive.box('authBox');

    String userEmail = box.get('userEmail', defaultValue: "No Email Found");
    String userName = box.get('userName', defaultValue: "No Name");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF121212),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Icon(
                Icons.person,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                userEmail,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 40),
              CustomAddButton(
                text: "Logout",
                icon: Icons.exit_to_app,
                colour: Color(0xFFFC4C02),
                onPress: () {
                  logoutController.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
