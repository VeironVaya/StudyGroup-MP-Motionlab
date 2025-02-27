import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tubes_nguliks/app/common/widgets/custom_login_button.dart';
import '../../../routes/app_pages.dart';
import 'package:tubes_nguliks/app/modules/login/controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF121212),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Image(
                image: AssetImage('assets/images/img_logo_final.png'),
                height: 150,
                width: 150,
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 250,
                width: 250,
                child: Lottie.asset(
                  'assets/lotties/lottie_login.json',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 50),
              CustomLoginButton(
                text: "Continue With Google",
                colour: Color(0xFF3B3B3B),
                onPress: () {
                  loginController.signInWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
