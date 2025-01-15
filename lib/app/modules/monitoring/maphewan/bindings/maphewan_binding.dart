import 'package:get/get.dart';

import '../controllers/maphewan_controller.dart';

class MapHewanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapHewanController>(
      () => MapHewanController(),
    );
  }
}
