import 'package:assignment_week2_slicing_ui/util/custom_button_util.dart';
import 'package:assignment_week2_slicing_ui/util/custom_text_field_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: SizedBox(
                height: 80,
              )),
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
                height: 54,
              ),
              CustomTextFieldUtil(
                icon: Icons.person_outlined,
                hintText: "Full Name",
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
                icon: Icons.lock_outlined,
                hintText: "Password",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldUtil(
                icon: Icons.lock_outlined,
                hintText: "Confirm Password",
              ),
              SizedBox(
                height: 20,
              ),
              CustomButtonUtil(
                label: "Register",
                function: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      "Login",
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
