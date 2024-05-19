import 'package:flutter/material.dart';

double iconSize = 24;
double defaultMargin = 20;

class GetInsets {
  static EdgeInsets paddingScreen(BuildContext context) {
    var padding = EdgeInsets.symmetric(
        horizontal: 4 * MediaQuery.of(context).size.width / 100);
    return padding;
  }

  static EdgeInsets onlyCustom(
    BuildContext context, {
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    var padding = EdgeInsets.only(
      left: left * MediaQuery.of(context).size.width / 100,
      right: right * MediaQuery.of(context).size.width / 100,
      top: top * MediaQuery.of(context).size.width / 100,
      bottom: bottom * MediaQuery.of(context).size.width / 100,
    );
    return padding;
  }

  static EdgeInsets paddingCustom(
    BuildContext context, {
    double gapX = 0.0,
    double gapY = 0.0,
  }) {
    var padding = EdgeInsets.symmetric(
        horizontal: gapX * MediaQuery.of(context).size.width / 100,
        vertical: gapY * MediaQuery.of(context).size.height / 100);
    return padding;
  }

  static EdgeInsets paddingItem(BuildContext context) {
    var padding = EdgeInsets.symmetric(
        vertical: 1 * MediaQuery.of(context).size.width / 100,
        horizontal: 1 * MediaQuery.of(context).size.width / 100);
    return padding;
  }

  static EdgeInsets paddingContent(BuildContext context) {
    var padding = EdgeInsets.symmetric(
        vertical: 2 * MediaQuery.of(context).size.width / 100);
    return padding;
  }

  static EdgeInsets paddingSmall(BuildContext context) {
    var padding = EdgeInsets.symmetric(
        vertical: 2 * MediaQuery.of(context).size.height / 100);
    return padding;
  }

  static EdgeInsets paddingMiddle(BuildContext context) {
    var padding = EdgeInsets.symmetric(
        vertical: 4 * MediaQuery.of(context).size.height / 100);
    return padding;
  }

  static EdgeInsets paddingLarge(BuildContext context) {
    var padding = EdgeInsets.symmetric(
        vertical: 6 * MediaQuery.of(context).size.height / 100);
    return padding;
  }

  static EdgeInsets paddingBottom(BuildContext context) {
    var padding = EdgeInsets.symmetric(
        vertical: 2 * MediaQuery.of(context).size.height / 100);
    return padding;
  }
}

// extension CusSizerExt on num {
//   double get h => this * Get.height / 100;
//   double get w => this * Get.width / 100;
//   double get sp => this * (Get.width / 3) / 100;
// }

// EdgeInsets paddingScreen = EdgeInsets.symmetric(horizontal: 4.w);
// EdgeInsets paddingItem = EdgeInsets.symmetric(vertical: 1.w);
// EdgeInsets paddingContent = EdgeInsets.symmetric(vertical: 2.w);
// EdgeInsets paddingSmall = EdgeInsets.symmetric(vertical: 2.h);
// EdgeInsets paddingMiddle = EdgeInsets.symmetric(vertical: 4.h);
// EdgeInsets paddingLarge = EdgeInsets.symmetric(vertical: 6.h);
// EdgeInsets paddingBottom = EdgeInsets.symmetric(vertical: 2.h);

EdgeInsets padTextField =
    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0);
OutlineInputBorder styleBorder =
    OutlineInputBorder(borderRadius: BorderRadius.circular(6.0));

/////////////////// text style Bold ///////////////////
const TextStyle headingB1 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

const TextStyle headingB1Medium = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
);

const TextStyle headingB2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

const TextStyle headingB3 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

const TextStyle headingB4 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

const TextStyle headingB5 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
);

const TextStyle headingB6 = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w700,
);

const TextStyle headingB7 = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w700,
);

const TextStyle headingB8 = TextStyle(
  fontSize: 9,
  fontWeight: FontWeight.w700,
);

/////////////////// text style semi Bold ///////////////////
const TextStyle headingSemi1 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

const TextStyle headingMedium2 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

const TextStyle headingSemi2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const TextStyle headingSemi3 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const TextStyle headingSemi4 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const TextStyle headingSemi5 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

const TextStyle headingSemi6 = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w600,
);

const TextStyle headingSemi7 = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w600,
);

const TextStyle headingSemi8 = TextStyle(
  fontSize: 9,
  fontWeight: FontWeight.w600,
);

/////////////////// text style regular ///////////////////
const TextStyle regular1 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w400,
);

const TextStyle regular2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

const TextStyle regular3 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const TextStyle regular4 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

const TextStyle regular5 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

const TextStyle regular6 = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w400,
);

const TextStyle regular7 = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

const TextStyle regular8 = TextStyle(
  fontSize: 9,
  fontWeight: FontWeight.w400,
);
