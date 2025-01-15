// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/data/lokasi_utama.response.model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../../data/api.service.dart';
import '../../../../data/lokasi_hewan.response.model.dart';

class MapHewanController extends GetxController
    with SingleGetTickerProviderMixin {
  var startedId = 'AnimatedMapController#MoveStarted';
  var inProgressId = 'AnimatedMapController#MoveInProgress';
  var finishedId = 'AnimatedMapController#MoveFinished';

  late final ApiService _apiService;
  late final _events = LokasiHewanResponseModel().obs;
  late final _pointSet = ''.obs;
  final CarouselController btnCarouselCtr = CarouselController();

  late final _result = Result().obs;
  Result get result => _result.value;

  late AnimationController animationController;
  final mapController = MapController();
  var currentLocation = const LatLng(-6.476737, 106.851021).obs;

  final _placemark = Rx<List<Placemark>?>(null);
  List<Placemark>? get placemark => _placemark.value;

  var setLocation = const LatLng(0, 0).obs;
  var address = ''.obs;
  var isHide = true.obs;
  var page = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    _apiService = Get.put(ApiService());
    _result.value = Get.arguments ?? Result();
    _apiService.bidSocket().connect();
    connect();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    if (Get.arguments != null) {
      var latLong = parseLatLong(Get.arguments);
      setLocation.value = LatLng(
        double.parse(latLong[0]),
        double.parse(latLong[1]),
      );
      if (setLocation.value != const LatLng(0, 0)) {
        await setPlaceMark(setLocation.value);
      }
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    _apiService.bidSocket().disconnect();
    super.onClose();
  }

  List<String> parseLatLong(String location) {
    return location.split(',').map((e) => e.trim()).toList();
  }

  void animatedMapMoveWithZoom(LatLng destLocation, double destZoom) {
    final camera = mapController.camera;
    final latTween = Tween<double>(
        begin: camera.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: camera.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: camera.zoom, end: destZoom);

    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    final startIdWithTarget =
        '$startedId#${destLocation.latitude},${destLocation.longitude},$destZoom';
    bool hasTriggeredMove = false;

    controller.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = inProgressId;
      }

      hasTriggeredMove |= mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
        id: id,
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  void animatedMapMove(LatLng destLocation) {
    final camera = mapController.camera;
    final latTween = Tween<double>(
        begin: camera.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: camera.center.longitude, end: destLocation.longitude);

    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    final startIdWithTarget =
        '$startedId#${destLocation.latitude},${destLocation.longitude}';
    bool hasTriggeredMove = false;

    controller.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = inProgressId;
      }

      hasTriggeredMove |= mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        camera.zoom, // menggunakan nilai zoom dari camera saat ini
        id: id,
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  Future<void> setPlaceMark(LatLng point) async {
    try {
      List<Placemark> newPlace =
          await placemarkFromCoordinates(point.latitude, point.longitude);

      if (newPlace.isNotEmpty) {
        Placemark placeMark = newPlace[0];
        address.value =
            "${placeMark.street}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea} ${placeMark.postalCode}, ${placeMark.country}";
      }
    } finally {}
  }

  Stream<LokasiHewanResponseModel> get eventStream => _events.stream;
  String get pointSet => _pointSet.value;

  void connect() {
    _apiService.bidSocket().on('connect', (_) {
      debugPrint('Connected to Socket.IO server');
    });

    _apiService.bidSocket().on('disconnect', (_) {
      debugPrint('Disconnected from Socket.IO server');
    });

    _apiService.bidSocket().on('titikhewan', (data) {
      lokasiHewan(data);
    });
  }

  void lokasiHewan(msg) {
    var data = jsonEncode(msg);
    final messageModel = LokasiHewanResponseModel.fromJson(jsonDecode(data));
    _events(messageModel);

    if ((messageModel.dataTitik ?? []).isNotEmpty) {
      isHide(false);
    }
    update();
  }
}
