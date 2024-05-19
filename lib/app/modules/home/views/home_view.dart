import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/helper/format_number_helper.dart';
import 'package:flutter_farm_map/app/helper/gap_separate.dart';
import 'package:flutter_farm_map/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../data/response.model.dart';
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
              child: StreamBuilder<SocketSolarPanelModel>(
                stream: controller.eventStream,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      ViewHeaderUI(controller: controller, snapshot: snapshot),
                      ViewContent(controller: controller, snapshot: snapshot)
                    ],
                  );
                },
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
    required this.snapshot,
    required this.controller,
  });

  final AsyncSnapshot<SocketSolarPanelModel> snapshot;
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
              color: snapshot.connectionState == ConnectionState.active
                  ? online
                  : warning,
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
    required this.snapshot,
    required this.controller,
  });

  final AsyncSnapshot<SocketSolarPanelModel> snapshot;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    // if (snapshot.hasData) {
    final event = snapshot.data ?? SocketSolarPanelModel();

    var daya = double.parse(event.daya ?? '0');

    return Column(
      children: [
        ...[
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IntrinsicWidth(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: primaryGrey,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            'PRODUKSI DAYA',
                            style: headingSemi7.copyWith(color: primaryDark),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset(
                            colorFilter: ColorFilter.mode(
                                daya > 0 ? warning : primaryGrey,
                                BlendMode.srcIn),
                            icLightning,
                            width: 12,
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${(double.parse(event.daya ?? '0').toGMK)}W",
                  style: headingB.copyWith(color: primaryDark),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "TEGANGAN",
              style: headingSemi6.copyWith(color: primaryDark),
            ),
            subtitle: Text(
              "${(double.parse(event.tegangan ?? '0').toGMK)}V",
              style: headingBMedium.copyWith(color: primaryDark),
            ),
          ),
          ListTile(
            title: Text(
              "ARUS",
              style: headingSemi6.copyWith(color: primaryDark),
            ),
            subtitle: Text(
              "${(double.parse(event.arus ?? '0').toGMK)}A",
              style: headingBMedium.copyWith(color: primaryDark),
            ),
          ),
          ListTile(
            title: Text(
              "SUHU",
              style: headingSemi6.copyWith(color: primaryDark),
            ),
            subtitle: Text(
              "${(double.parse(event.suhu ?? '0').toGMK)} ℃",
              style: headingBMedium.copyWith(color: primaryDark),
            ),
          ),
          
          ElevatedButton(
            onPressed: () async {
              await Get.toNamed(
                Routes.MAP,
                arguments:
                    // controller.costumerDatum.value.titikMaps ??
                    controller.pointSet,
              );
            },
            child: const Text("To Map"),
          )
        ].separateTest(
          2,
          child: const Divider(thickness: 1, color: primaryLightGrey),
        ),
      ],
    );
    // } else if (snapshot.hasError) {
    //   return Text('Error: ${snapshot.error}');
    // } else if (snapshot.connectionState == ConnectionState.waiting) {
    //   return CircularProgressIndicator();
    // } else {
    //   return const Center(
    //     child: Text('Web Socket not Connect'),
    //   );
    // }
  }
}
