// ignore_for_file: use_super_parameters

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/helper/box_card.dart';
import 'package:flutter_farm_map/app/helper/config/color.config.dart';
import 'package:flutter_farm_map/app/helper/config/dimens.config.dart';
import 'package:flutter_farm_map/app/helper/config/padding.config.dart';
import 'package:flutter_farm_map/app/helper/popup_alert.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:ripple_wave/ripple_wave.dart';

import '../../../data/lokasi_hewan.response.model.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<SiteMapController> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<LokasiHewanResponseModel>(
          stream: controller.eventStream,
          builder: (ctx, snapshot) {
            return Obx(
              () => Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        FlutterMap(
                          mapController: controller.mapController,
                          options: MapOptions(
                            initialCenter: controller.currentLocation.value,
                            initialZoom: 16,
                            minZoom: 3.0,
                            interactionOptions: const InteractionOptions(
                              flags: InteractiveFlag.pinchZoom |
                                  InteractiveFlag.drag |
                                  InteractiveFlag.flingAnimation |
                                  InteractiveFlag.pinchMove |
                                  InteractiveFlag.doubleTapZoom |
                                  InteractiveFlag.doubleTapDragZoom |
                                  InteractiveFlag.scrollWheelZoom,
                            ),
                            onTap: (_, point) {
                              // controller.setLocation.value = point;
                              // controller.setPlaceMark(point);

                              // Alert.errorSnackBar(
                              //     desc: "Contact Delete successfully");
                            },
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.mobile_apps',
                            ),
                            MarkerLayer(
                              markers: [
                                const Marker(
                                  width: 30,
                                  height: 30,
                                  // point: LatLng(controller.currentPosition?.latitude ?? 0, controller.currentPosition?.longitude ?? 0),
                                  point: LatLng(-6.476737, 106.851021),
                                  alignment: Alignment.topCenter,
                                  child: RippleWave(
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                ...List.generate(
                                  (snapshot.data?.dataTitik?.length ?? 0),
                                  (index) {
                                    return _buildPin(
                                      LatLng(
                                        double.parse(snapshot.data
                                                ?.dataTitik?[index].latitude ??
                                            "0"),
                                        double.parse(snapshot.data
                                                ?.dataTitik?[index].longitude ??
                                            "0"),
                                      ),
                                    );
                                  },
                                )..sort(
                                    (a, b) => b.point.latitude
                                        .compareTo(a.point.latitude),
                                  ),
                                if (controller.setLocation.value !=
                                    const LatLng(0, 0))
                                  _buildPin(controller.setLocation.value),
                              ],
                            ),
                            CircleLayer(
                              circles: [
                                CircleMarker(
                                  point: LatLng(
                                    double.parse(
                                        controller.result.latitude ?? '0'),
                                    double.parse(
                                        controller.result.longitude ?? '0'),
                                  ),
                                  radius: double.parse(
                                      controller.result.batas ?? '10'),
                                  useRadiusInMeter: true,
                                  color: Colors.blue.withOpacity(0.2),
                                  borderColor: Colors.blue,
                                  borderStrokeWidth: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8, bottom: 20),
                          color: ColorApps.white.withOpacity(0.5),
                          height: 100,
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 45,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const SizedBox(
                                        width: 60,
                                        child: Icon(
                                            Icons.arrow_back_ios_outlined)),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Titik Lokasi Hewan',
                                        style: headingSemi2.copyWith(
                                            color: ColorApps.darkGrey),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.animatedMapMoveWithZoom(
                                          controller.currentLocation.value,
                                          16.0);
                                    },
                                    child: const SizedBox(
                                      width: 60,
                                      child: FaIcon(FontAwesomeIcons.mapPin),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        AnimatedPositioned(
                          left: 0,
                          right: 0,
                          bottom: controller.isHide.value ? -290 : 0,
                          duration: 200.milliseconds,
                          curve: Curves.easeIn,
                          child: Container(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            color: ColorApps.white.withOpacity(0.5),
                            child: CarouselSlider.builder(
                              itemCount: snapshot.data?.dataTitik?.length ?? 0,
                              itemBuilder: (context, index, realIndex) {
                                var obj = snapshot.data?.dataTitik?[index];

                                if ((obj?.alert ?? false) == true) {
                                  Alert.errorSnackBar(desc: 'abang');
                                }

                                return _lokasiHewanItem(index, obj, context);
                              },
                              carouselController: controller.btnCarouselCtr,
                              options: CarouselOptions(
                                enableInfiniteScroll: false,
                                onPageChanged: (index, reason) {
                                  final obj =
                                      (snapshot.data?.dataTitik ?? []).isEmpty
                                          ? null
                                          : snapshot.data?.dataTitik?[index];
                                  controller.animatedMapMoveWithZoom(
                                    LatLng(double.parse(obj?.latitude ?? '0'),
                                        double.parse(obj?.longitude ?? '0')),
                                    17.5,
                                  );
                                  controller.page.value = index;
                                },
                                clipBehavior: Clip.none,
                                viewportFraction: 0.9,
                                height: 220,
                                padEnds: false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: _dataKandangItem(
                        snapshot.data?.dataKandang ?? DataKandang(), context),
                  )
                ],
              ),
            );
          }),
    );
  }

  _lokasiHewanItem(int index, DataTitik? obj, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Titik Lokasi Hewan ${index + 1}',
                  style: headingSemi4.copyWith(color: ColorApps.darkColor),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Suhu:', style: regular5),
                      ),
                      BoxCard(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        isShadow: false,
                        color: ColorApps.inActiveLight,
                        borderRadius: 10,
                        contentWidth: double.infinity,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("${(obj?.suhu ?? '0')} °C",
                                style: headingSemi5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Paddings.itemsGapCustom(context, gapX: 4),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Humadity:', style: regular5),
                      ),
                      BoxCard(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        isShadow: false,
                        color: ColorApps.inActiveLight,
                        borderRadius: 10,
                        contentWidth: double.infinity,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("${(obj?.humidity ?? '0')} %",
                                style: headingSemi5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Paddings.itemsGapCustom(context, gapY: 2),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Jarak:', style: regular5),
                      ),
                      BoxCard(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        isShadow: false,
                        color: (obj?.alert ?? false)
                            ? ColorApps.red.withOpacity(0.2)
                            : ColorApps.green.withOpacity(0.1),
                        borderRadius: 10,
                        contentWidth: double.infinity,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("${(obj?.jarak ?? '0')} m",
                                style: headingSemi5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Paddings.itemsGapCustom(context, gapX: 4),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Status:', style: regular5),
                      ),
                      BoxCard(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        isShadow: false,
                        color: (obj?.alert ?? false)
                            ? ColorApps.red.withOpacity(0.2)
                            : ColorApps.green.withOpacity(0.1),
                        borderRadius: 10,
                        contentWidth: double.infinity,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child:
                                Text(obj?.message ?? '', style: headingSemi5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Paddings.itemsGapCustom(context, gapY: 5),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Latitude:', style: regular5),
                      ),
                      BoxCard(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        isShadow: false,
                        color: ColorApps.inActiveLight,
                        borderRadius: 10,
                        contentWidth: double.infinity,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text((obj?.latitude ?? '0'),
                                style: headingSemi5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Paddings.itemsGapCustom(context, gapX: 4),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Longitude:', style: regular5),
                      ),
                      BoxCard(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        isShadow: false,
                        color: ColorApps.inActiveLight,
                        borderRadius: 10,
                        contentWidth: double.infinity,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text((obj?.longitude ?? '0'),
                                style: headingSemi5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _dataKandangItem(DataKandang? obj, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: ColorApps.white,
      child: Container(
        height: 155,
        color: ColorApps.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Data Kandang',
                  style: headingSemi4.copyWith(color: ColorApps.darkColor),
                ),
              ],
            ),
            const Divider(),
            obj?.humidity == null
                ? Container(
                    height: 99,
                    width: MediaQuery.of(context).size.width,
                    color: ColorApps.white,
                    child: const Center(child: Text("Data Not Found")),
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text('Suhu:', style: regular5),
                                ),
                                BoxCard(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  isShadow: false,
                                  color: ColorApps.inActiveLight,
                                  borderRadius: 10,
                                  contentWidth: double.infinity,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("${(obj?.suhu ?? '0')} °C",
                                          style: regular5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Paddings.itemsGapCustom(context, gapX: 4),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child:
                                      const Text('Humadity:', style: regular5),
                                ),
                                BoxCard(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  isShadow: false,
                                  color: ColorApps.inActiveLight,
                                  borderRadius: 10,
                                  contentWidth: double.infinity,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("${(obj?.humidity ?? '0')} %",
                                          style: regular5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Paddings.itemsGapCustom(context, gapY: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text('Pulse Heart:',
                                      style: regular5),
                                ),
                                BoxCard(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  isShadow: false,
                                  color: ColorApps.inActiveLight,
                                  borderRadius: 10,
                                  contentWidth: double.infinity,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text((obj?.pulseHeart ?? '0'),
                                          style: regular5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Paddings.itemsGapCustom(context, gapX: 4),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text('mq135:', style: regular5),
                                ),
                                BoxCard(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  isShadow: false,
                                  color: ColorApps.inActiveLight,
                                  borderRadius: 10,
                                  contentWidth: double.infinity,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text((obj?.mq135 ?? '0'),
                                          style: regular5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            const Divider(),
            Paddings.itemsGapCustom(context, gapY: 4),
          ],
        ),
      ),
    );
  }

  _buildPin(LatLng point) {
    return Marker(
      width: 30,
      height: 30,
      point: point,
      alignment: Alignment.topCenter,
      child: const RippleWave(
        color: Colors.white,
        child: Icon(
          Icons.location_pin,
          color: Colors.red,
          size: 30,
        ),
      ),
    );
  }
}
