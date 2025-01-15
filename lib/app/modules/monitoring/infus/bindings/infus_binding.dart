import 'package:get/get.dart';

import '../controllers/infus_controller.dart';

class InfusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfusController>(
      () => InfusController(),
    );
  }
}
