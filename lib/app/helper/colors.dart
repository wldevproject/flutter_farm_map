import 'package:flutter/material.dart';

const baseColor = Color(0xFFF8F8F8);
const primaryGrey = Color(0xFF3F3F3F);
const primaryHint = Color(0xFFA7A7A7);
const primaryLightGrey = Color(0xFFCCCCCC);
const primaryDark = Color(0xFF2A2A2A);

const online = Color(0xFF30DE15);
const offline = Color(0xFFE11F26);
const warning = Color(0xFFFFB00B);

Color shimmerColor = Colors.grey[200]!;
Color shimmerLoadingColor = Colors.grey[50]!;

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};
