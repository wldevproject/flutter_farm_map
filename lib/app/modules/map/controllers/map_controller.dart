// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_farm_map/app/helper/location_helper.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../data/api.service.dart';
import '../../../data/lokasi_hewan.response.model.dart';

class SiteMapController extends GetxController
    with SingleGetTickerProviderMixin {
  var startedId = 'AnimatedMapController#MoveStarted';
  var inProgressId = 'AnimatedMapController#MoveInProgress';
  var finishedId = 'AnimatedMapController#MoveFinished';

  late final ApiService _apiService;
  late final _events = LokasiHewanResponseModel().obs;
  late final _pointSet = ''.obs;
  late AnimationController animationController;
  final mapController = MapController();
  var currentLocation =
      const LatLng(-6.476737, 106.851021).obs;

  final _placemark = Rx<List<Placemark>?>(null);
  List<Placemark>? get placemark => _placemark.value;

  // final _currentPosition = Rx<Position?>(null);
  // Position? get currentPosition => _currentPosition.value;
  // final TextEditingController locationController = TextEditingController();

  var setLocation = const LatLng(0, 0).obs;
  var address = ''.obs;
  var isHide = true.obs;

  @override
  void onInit() async {
    super.onInit();
    _apiService = Get.put(ApiService());
    _apiService.bidSocket().connect();
    connect();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    // getCurrentLocation(isFirst: true);

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

  void animatedMapMove(LatLng destLocation, double destZoom) {
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

  // void getCurrentLocation({
  //   bool isFirst = false,
  //   bool enableMapController = true,
  // }) async {
  //   try {
  //     // isLoadingLocation(true);
  //     var location = await LocationHelper.getCurrentLocation();
  //     var locationConvert = await placemarkFromCoordinates(
  //       location.latitude,
  //       location.longitude,
  //     );
  //     _placemark.value = locationConvert;
  //     _currentPosition.value = location;
  //
  //     if (enableMapController) {
  //       if (setLocation.value != const LatLng(0, 0)) {
  //         mapController.move(setLocation.value, 16);
  //         isHide(false);
  //       } else {
  //         mapController.move(LatLng(location.latitude, location.longitude), 16);
  //       }
  //       currentLocation.value = LatLng(location.latitude, location.longitude);
  //     }
  //
  //     if (isFirst == false) {
  //       locationController.text =
  //           '${locationConvert[0].subAdministrativeArea}, ${locationConvert[0].administrativeArea}';
  //     }
  //   } finally {
  //     // isLoadingLocation(false);
  //   }
  // }

  Future<void> setPlaceMark(LatLng point) async {
    try {
      List<Placemark> newPlace =
          await placemarkFromCoordinates(point.latitude, point.longitude);

      if (newPlace.isNotEmpty) {
        Placemark placeMark = newPlace[0];
        address.value =
            "${placeMark.street}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea} ${placeMark.postalCode}, ${placeMark.country}";
        isHide(false);
      }
    } finally {
      // isLoadingLocation(false);
    }
  }

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
      // print('data $data');
      lokasiHewan(data);
    });
  }

  void lokasiHewan(msg) {
    var data = jsonEncode(msg);
    final messageModel = LokasiHewanResponseModel.fromJson(jsonDecode(data));
    _events(messageModel);
    print(data);
    update();
  }
}
