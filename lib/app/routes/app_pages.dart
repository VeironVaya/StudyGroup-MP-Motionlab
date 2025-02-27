import 'package:get/get.dart';
import 'package:tubes_nguliks/app/modules/login/views/login_view.dart';
import 'package:tubes_nguliks/app/modules/login/bindings/login_binding.dart';

import 'package:tubes_nguliks/app/modules/home/views/home_view.dart';
import 'package:tubes_nguliks/app/modules/home/bindings/home_binding.dart';

import 'package:tubes_nguliks/app/modules/profile/views/profile_view.dart';
import 'package:tubes_nguliks/app/modules/profile/bindings/profile_binding.dart';

import 'package:tubes_nguliks/app/modules/song/view/song_view.dart';
import 'package:tubes_nguliks/app/modules/song/bindings/song_binding.dart';

import 'package:tubes_nguliks/app/modules/part/views/part_view.dart';
import 'package:tubes_nguliks/app/modules/part/bindings/part_binding.dart';

part 'app_routes.dart'; // ✅ Include this to allow `part of` to work

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.LOGIN;
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.SONG,
      page: () => SongView(
        songTitle: Get.arguments['title'] ?? "Unknown Title",
        songArtist: Get.arguments['artist'] ?? "Unknown Artist",
      ),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
    ),
    GetPage(
      name: Routes.PART,
      page: () => PartView(
        songTitle: Get.arguments['title'],
      ),
    ),
  ];
}
