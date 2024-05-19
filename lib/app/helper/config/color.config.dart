import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/helper/config/theme.config.dart';

class ColorApps {
  static Color get baseColor => const Color(0xFFF2F3F3);
  static Color get grey => const Color(0xFF808080);
  static Color get white => const Color(0xFFFCFAFA);
  static Color get active => const Color(0xFFFFC502);
  static Color get activeLight => const Color(0xFFFFF6D8);
  static Color get activeDark => const Color(0xFFC69D16);
  static Color get inActive => const Color(0xFFDADADA);
  static Color get inActiveLight => const Color(0xFFF1F1F1);
  static Color get activeChips => const Color(0xFFE9FFE3);
  static Color get darkColor => const Color(0xFF212121);
  static Color get darkGrey => const Color(0xFF363636);
  static Color get darkBlue => const Color(0xFF1e3f66);
  static Color get red => const Color(0xFFC52525);
  static Color get green => const Color(0xFF30AA17);
  static Color get like => secondarySeedColor;
  static Color get shimmerColor => Colors.grey[200]!;
  static Color get shimmerLoadingColor => Colors.grey[50]!;
  static Color get borderOff => const Color(0xffd2d2d2);

  static MaterialColor get materialActive => MaterialColor(0xFFD3A40E, color);

  static Color baseColorDark(BuildContext context) {
    return Theme.of(context).colorScheme.brightness == Brightness.dark
        ? darkColor
        : baseColor;
  }

  static Color themeDark(BuildContext context) {
    return Theme.of(context).colorScheme.brightness == Brightness.dark
        ? darkColor
        : active;
  }

  static Color themeLight(BuildContext context) {
    return Theme.of(context).colorScheme.brightness == Brightness.light
        ? darkColor
        : white;
  }

  static Color themeIconLight(BuildContext context) {
    return Theme.of(context).colorScheme.brightness == Brightness.light
        ? grey
        : white;
  }
}

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
