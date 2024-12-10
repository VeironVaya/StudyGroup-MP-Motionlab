import 'package:assignment_week2_slicing_ui/pages/home_page.dart';
import 'package:assignment_week2_slicing_ui/pages/login_page.dart';
import 'package:assignment_week2_slicing_ui/pages/product_details.dart';
import 'package:assignment_week2_slicing_ui/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => MyHomePage(),
        '/product_detailes': (context) => const ProductDetails(),
      },
    );
  }
}
