import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:assignment_week2_slicing_ui/pages/home_page.dart';
import 'package:assignment_week2_slicing_ui/pages/invoice_page.dart';
import 'package:assignment_week2_slicing_ui/pages/login_page.dart';
import 'package:assignment_week2_slicing_ui/pages/product_details.dart';
import 'package:assignment_week2_slicing_ui/pages/register_page.dart';
import 'package:assignment_week2_slicing_ui/pages/cart_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Open the auth box to check login status
  var authBox = await Hive.openBox('authBox');
  bool isLoggedIn = authBox.get('isLoggedIn', defaultValue: false);

  // Open the favorites box
  await Hive.openBox<int>('favorites'); // Box for storing favorite product IDs

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? '/home' : '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => MyHomePage(),
        '/cart': (context) => const CartPage(),
        '/invoice': (context) => const InvoicePage(),
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
