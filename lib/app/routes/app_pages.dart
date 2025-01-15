import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/monitoring/infus/bindings/infus_binding.dart';
import '../modules/monitoring/infus/views/infus_view.dart';
import '../modules/monitoring/maphewan/bindings/maphewan_binding.dart';
import '../modules/monitoring/maphewan/views/maphewan_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => const MapHewanView(),
      binding: MapHewanBinding(),
    ),
    GetPage(
      name: _Paths.INFUS,
      page: () => const InfusView(),
      binding: InfusBinding(),
    ),
  ];
}
