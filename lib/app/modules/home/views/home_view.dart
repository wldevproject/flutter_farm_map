import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/helper/config/color.config.dart';
import 'package:flutter_farm_map/app/helper/config/dimens.config.dart';
import 'package:flutter_farm_map/app/helper/config/icons.config.dart';
import 'package:flutter_farm_map/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_farm_map/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Stack(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(image: AssetImage(imgPanelPNG)),
              ],
            ),
            SafeArea(
              child: Column(
                children: [
                  ViewHeaderUI(controller: controller),
                  ViewContent(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewHeaderUI extends StatelessWidget {
  const ViewHeaderUI({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: ClipOval(
            child: Container(
              height: 12,
              width: 12,
              color: ColorApps.active,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'Live',
            style: regular4.copyWith(color: ColorApps.darkColor),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 2,
                color: ColorApps.darkColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ViewContent extends StatelessWidget {
  const ViewContent({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            await controller.fetchLokasiUtama();
            Get.toNamed(Routes.MAP_HEWAN, arguments: controller.result);
          },
          child: const Text("Map Hewan"),
        ),
        ElevatedButton(
          onPressed: () async {
            await controller.fetchLokasiUtama();
            Get.toNamed(Routes.INFUS);
          },
          child: const Text("Infus"),
        ),
      ],
    );
  }
}
