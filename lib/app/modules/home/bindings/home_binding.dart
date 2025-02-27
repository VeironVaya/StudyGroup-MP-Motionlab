import 'package:get/get.dart';
import 'package:tubes_nguliks/app/modules/home/controllers/home_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
