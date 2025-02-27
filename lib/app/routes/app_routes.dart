part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const SONG = _Paths.SONG;
  static const PROFILE = _Paths.PROFILE;
  static const PART = _Paths.PART;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const SONG = '/song';
  static const PROFILE = '/profile';
  static const PART = '/part';
}
