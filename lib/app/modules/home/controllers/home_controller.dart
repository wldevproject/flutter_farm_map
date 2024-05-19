import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/api.service.dart';
import '../../../data/lokasi_hewan.response.model.dart';

class HomeController extends GetxController {
  late final ApiService _apiService;
  late final _events = LokasiHewanResponseModel().obs;
  late final _pointSet = ''.obs;

  Stream<LokasiHewanResponseModel> get eventStream => _events.stream;
  String get pointSet => _pointSet.value;

  void connect() {
    _apiService.bidSocket().on('connect', (_) {
      print('Connected to Socket.IO server');
    });

    _apiService.bidSocket().on('disconnect', (_) {
      print('Disconnected from Socket.IO server');
    });

    _apiService.bidSocket().on('titikhewan', (data) {
      print('data $data');
      // lokasiHewan(data);
    });
  }

  void lokasiHewan(msg) {
    var data = jsonEncode(msg);
    final messageModel = LokasiHewanResponseModel.fromJson(jsonDecode(data));
    _events(messageModel);
    update();
  }

  @override
  void onInit() {
    _apiService = Get.put(ApiService());
    _apiService.bidSocket().connect();
    connect();
    super.onInit();
  }

  void close() {
    _apiService.bidSocket().disconnect();
  }

  @override
  void onClose() {
    super.onClose();
    close();
  }
}
