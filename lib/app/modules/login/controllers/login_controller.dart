import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var box = Hive.box('authBox');

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      //Save login state
      if (user != null) {
        var box = Hive.box('authBox');
        box.put('isLoggedIn', true);
        box.put('userEmail', user.email);
        box.put('userName', user.displayName ?? "No Name");
        box.put('userPhoto', user.photoURL ?? "");

        Get.offNamed(Routes.HOME);
      }
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();

    // Clear login state
    box.delete('isLoggedIn');
    box.delete('userEmail');
    await box.clear();

    Get.offAllNamed(Routes.LOGIN);
  }
}
