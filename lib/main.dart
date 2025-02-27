import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tubes_nguliks/app/modules/home/controllers/home_controller.dart';
import 'package:tubes_nguliks/app/modules/login/controllers/login_controller.dart';
import 'package:tubes_nguliks/app/modules/part/controllers/part_controller.dart';
import 'package:tubes_nguliks/app/modules/profile/controllers/profile_controller.dart';
import 'package:tubes_nguliks/app/modules/song/controllers/song_controller.dart';
import 'package:tubes_nguliks/app/routes/app_pages.dart';
import 'package:tubes_nguliks/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await Hive.openBox('authBox');

  Get.put(LoginController());
  Get.put(ProfileController());
  Get.put(HomeController());
  Get.put(PartController());
  Get.put(SongController());

  var box = Hive.box('authBox');
  bool isLoggedIn = box.get('isLoggedIn', defaultValue: false);

  // Check Firebase Auth
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLoggedIn = false;
    await box.clear(); // Ensure storage is also cleared
  }

  runApp(MainApp(isLoggedIn: isLoggedIn));
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: isLoggedIn ? Routes.HOME : Routes.LOGIN,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
