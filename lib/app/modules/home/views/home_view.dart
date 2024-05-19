import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../../../helper/colors.dart';
import '../../../helper/dimens_size.dart';
import '../../../helper/image.dart';

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
              color: online,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'Live',
            style: regular4.copyWith(color: primaryDark),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 2,
                color: primaryDark,
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
            await Get.toNamed(Routes.MAP);
          },
          child: const Text("To Map"),
        ),
      ],
    );
  }
}
