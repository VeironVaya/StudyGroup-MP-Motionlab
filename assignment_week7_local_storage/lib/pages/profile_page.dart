import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:assignment_week2_slicing_ui/util/custom_button_util.dart';
import 'package:assignment_week2_slicing_ui/util/custom_button_util.dart';
import 'package:assignment_week2_slicing_ui/util/custom_detail_row_util.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Logout function
  void _logout(BuildContext context) async {
    var box = Hive.box('authBox');
    await box.put('isLoggedIn', false); // Update login status
    Get.offAllNamed('/'); // Navigate back to login page
  }

  @override
  Widget build(BuildContext context) {
    // Define user profile data
    final String name = "Veiron Vaya Yarief";
    final String email = "veironvayayarief41@gmail.com";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Placeholder
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // User Information
            Text(
              "Name: $name",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Email: $email",
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF868A91),
              ),
            ),

            const SizedBox(height: 30),

            // Logout Button
            ElevatedButton(
              onPressed: () => _logout(context), // Call logout function
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00623B), // Button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
