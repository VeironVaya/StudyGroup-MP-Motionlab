import 'package:get/get.dart';
import 'package:tubes_nguliks/app/modules/song/controllers/song_controller.dart';

class SongBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SongController>(() => SongController());
  }
}
