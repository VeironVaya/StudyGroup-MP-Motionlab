import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignOut = GoogleSignIn();

  Future<void> signOut() async {
    await _googleSignOut.signOut();
    await _auth.signOut();
    Get.offNamed(Routes.LOGIN);
  }
}
