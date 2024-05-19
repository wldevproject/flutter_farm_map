import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/helper/bottom_press.dart';
import 'package:flutter_farm_map/app/helper/box_card.dart';
import 'package:flutter_farm_map/app/helper/config/color.config.dart';
import 'package:flutter_farm_map/app/helper/config/dimens.config.dart';
import 'package:flutter_farm_map/app/helper/config/padding.config.dart';
import 'package:flutter_farm_map/app/helper/container_card.dart';
import 'package:flutter_farm_map/app/helper/gap_separate.dart';
import 'package:flutter_farm_map/app/helper/pointlokasi.model.dart';
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
      appBar: AppBar(
        title: const Text('MapView'),
        centerTitle: true,
      ),
      body: StreamBuilder<LokasiHewanResponseModel>(
          stream: controller.eventStream,
          builder: (ctx, snapshot) {
            return Obx(() => Stack(
                  alignment: Alignment.topRight,
                  children: [
                    FlutterMap(
                      mapController: controller.mapController,
                      options: MapOptions(
                        initialCenter: controller.currentLocation.value,
                        initialZoom: 16.0,
                        minZoom: 3.0,
                        onTap: (_, point) {
                          controller.setLocation.value = point;
                          controller.setPlaceMark(point);
                        },
                        interactionOptions: const InteractionOptions(
                          flags: InteractiveFlag.pinchZoom |
                              InteractiveFlag.drag |
                              InteractiveFlag.flingAnimation |
                              InteractiveFlag.pinchMove |
                              InteractiveFlag.doubleTapZoom |
                              InteractiveFlag.doubleTapDragZoom |
                              InteractiveFlag.scrollWheelZoom,
                        ),
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
                            buildPin(const LatLng(-6.4750366, 106.851021)),
                            buildPin(const LatLng(-6.4760889, 106.8481697)),

                            // ...List.generate((snapshot.data?.result?.dataTitik?.length ?? 0),(index) {
                            //   return buildPin(LatLng(double.parse(snapshot.data?.result?.dataTitik?[index].latitude ?? "0") , double.parse(snapshot.data?.result?.dataTitik?[index].longitude ?? "0")));
                            // }),
                            if (controller.setLocation.value !=
                                const LatLng(0, 0))
                              buildPin(controller.setLocation.value),
                          ],
                        ),
                         CircleLayer(
                          circles: [
                            CircleMarker(
                              point: const LatLng(-6.476737, 106.851021),
                              radius: 30,
                              useRadiusInMeter: true,
                              color: Colors.blue.withOpacity(0.3),
                              borderColor: Colors.blue,
                              borderStrokeWidth: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    AnimatedPositioned(
                      bottom: controller.isHide.value ? -200 : 10,
                      right: 10,
                      left: 10,
                      duration: 200.milliseconds,
                      curve: Curves.easeIn,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ButtonPress(
                            icon: FontAwesomeIcons.mapLocationDot,
                            colorIcon: ColorApps.active,
                            onPressed: () {
                              controller.animatedMapMove(
                                  controller.currentLocation.value, 16.0);
                            },
                            backgroundColor: ColorApps.white.withOpacity(0.7),
                            height: 48,
                            width: 48,
                          ),
                          LocationPointContent(
                            controller: controller
                          ),
                        ].separate(10),
                      ),
                    ),
                  ],
                ));
          }),
    );
  }

  buildPin(LatLng point) {
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

class LocationPointContent extends StatelessWidget {
  final SiteMapController controller;

  const LocationPointContent({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var point = controller.setLocation.value;
    return ContainerCard(
      paddingContent: GetInsets.paddingCustom(
        context,
        gapX: 4,
        gapY: 2,
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Titik Lokasi',
              style: regular3.copyWith(color: ColorApps.darkColor),
            ),
            GestureDetector(
              child: Text(
                'Pilih',
                style: headingB3.copyWith(color: ColorApps.green),
              ),
              onTap: () {
                Get.back(
                  result: PointLokasi(
                    location: point,
                    address: controller.address.value,
                  ),
                );
              },
            ),
          ],
        ),
        const Divider(),
        Container(
          alignment: Alignment.centerLeft,
          child: const Text('Titik Maps:', style: regular4),
        ),
        BoxCard(
          padding: const EdgeInsets.all(16),
          isShadow: false,
          color: ColorApps.inActiveLight,
          borderRadius: 10,
          contentWidth: double.infinity,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text('${point.latitude}, ${point.longitude}',
                  style: regular4),
            ),
          ],
        ),
        Paddings.itemsGapCustom(context, gapY: 2),
        Container(
          alignment: Alignment.centerLeft,
          child: const Text('Alamat:', style: regular4),
        ),
        BoxCard(
          padding: const EdgeInsets.all(16),
          isShadow: false,
          color: ColorApps.inActiveLight,
          borderRadius: 10,
          contentWidth: double.infinity,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(controller.address.value, style: regular4),
            ),
          ],
        ),
        Paddings.itemsGapCustom(context, gapY: 2),
      ]),
    );
  }
}
