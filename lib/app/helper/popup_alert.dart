import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/helper/config/color.config.dart';
import 'package:get/get.dart';

class Alert {
  static errorSnackBar({required String desc}) {
    return Get.snackbar(
      "Warning!!",
      desc,
      animationDuration: const Duration(seconds: 1),
      backgroundColor: Colors.red.withOpacity(0.9),
      colorText: ColorApps.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      snackPosition: SnackPosition.TOP,
    );
  }

  static validSnackBar({required String desc}) {
    return Get.snackbar(
      "Success!!",
      desc,
      animationDuration: const Duration(seconds: 1),
      backgroundColor: Colors.green.withOpacity(0.9),
      colorText: ColorApps.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      snackPosition: SnackPosition.TOP,
    );
  }
}
