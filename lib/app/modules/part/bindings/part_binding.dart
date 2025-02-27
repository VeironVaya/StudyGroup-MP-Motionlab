import 'package:get/get.dart';
import 'package:tubes_nguliks/app/modules/part/controllers/part_controller.dart';

class PartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartController>(() => PartController());
  }
}
