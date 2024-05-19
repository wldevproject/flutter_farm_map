import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/api.service.dart';
import '../../../data/response.model.dart';

class HomeController extends GetxController {
  late final ApiService _apiService;
  late final _events = SocketSolarPanelModel().obs;
  late final _pointSet = ''.obs;

  Stream<SocketSolarPanelModel> get eventStream => _events.stream;
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
      setSolarPanel(data);
    });
  }

  void setSolarPanel(msg) {
    var data = jsonEncode(msg);
    final messageModel = SocketSolarPanelModel.fromJson(jsonDecode(data));
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
