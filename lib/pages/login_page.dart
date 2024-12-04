import 'package:assignment_week2_slicing_ui/pages/register_page.dart';
import 'package:assignment_week2_slicing_ui/util/custom_button_util.dart';
import 'package:assignment_week2_slicing_ui/util/custom_text_field_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //   child: SizedBox(
          //     child:
          //         Lottie.asset('assets/lotties/lottie_login.json', height: 300),
          //   ),
          // ),
          // SizedBox(height: 10),
          // Text(
          //   'Login Page',
          //   style: GoogleFonts.poppins(
          //     textStyle: TextStyle(fontSize: 20, color: Colors.blue),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // CustomTextFieldUtil(
          //   hintText: "Login",
          // ),
          // CustomTextFieldUtil(
          //   hintText: "Register",
          // )
          Center(
            child: Container(
              height: 360,
              width: 360,
              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          Text(
            "Welcome!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
          ),
          Text(
            "Happy Shopping All",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          CustomTextFieldUtil(
            hintText: "Email",
          ),
          CustomTextFieldUtil(
            hintText: "Password",
          ),
          CustomButtonUtil(label: "Login"),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}
