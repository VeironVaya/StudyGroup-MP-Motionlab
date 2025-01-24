import 'package:assignment_week2_slicing_ui/pages/home_page.dart';
import 'package:assignment_week2_slicing_ui/pages/invoice_page.dart';
import 'package:assignment_week2_slicing_ui/pages/login_page.dart';
import 'package:assignment_week2_slicing_ui/pages/product_details.dart';
import 'package:assignment_week2_slicing_ui/pages/register_page.dart';
import 'package:assignment_week2_slicing_ui/pages/cart_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => MyHomePage(),
        '/cart': (context) => CartPage(),
        '/invoice': (context) => InvoicePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/product_details') {
          final product = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ProductDetails(product: product),
          );
        }
        return null;
      },
    );
  }
}
