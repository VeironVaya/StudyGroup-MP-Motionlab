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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                  height: 265,
                  width: 280,
                  child: Image.asset(
                    'assets/images/login.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              Text(
                "Welcome!",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                "Happy Shopping All",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldUtil(
                icon: Icons.email_outlined,
                hintText: "Email",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldUtil(
                hintText: "Password",
                icon: Icons.lock_outlined,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButtonUtil(
                label: "Login",
                function: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF00623B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
