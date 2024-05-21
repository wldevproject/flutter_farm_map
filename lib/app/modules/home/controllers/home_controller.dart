import 'package:flutter_farm_map/app/data/api.service.dart';
import 'package:flutter_farm_map/app/data/lokasi_utama.response.model.dart';
import 'package:flutter_farm_map/app/helper/popup_alert.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late ApiService _service;
  var isLoading = false.obs;
  
  late final _result = Result().obs;
  Result get result => _result.value;

  @override
  void onInit() {
    _service = Get.put(ApiService());
    super.onInit();
  }

  @override
  void onClose() {}

  Future<void> fetchLokasiUtama() async {
    isLoading(true);
    try {
      final response = await _service.fetchLokasiUtama();

      if (response?.status == 200) {
        _result.value = response?.result ?? Result();
      } else {
        Alert.errorSnackBar(
            desc: response?.message ??
                "Please check Internet or your Credentials");
      }
    } finally {
      isLoading(false);
    }
  }
}
