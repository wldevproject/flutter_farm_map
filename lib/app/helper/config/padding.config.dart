import 'package:flutter/material.dart';

import 'dimens.config.dart';

class Paddings {
  static Padding items(BuildContext context) {
    return Padding(padding: GetInsets.paddingItem(context));
  }

  static Padding itemsHorizontal(BuildContext context) {
    return const Padding(padding: EdgeInsets.symmetric(horizontal: 4));
  }

  static Padding itemsGapCustom(BuildContext context, {double gapX = 0.0, double gapY = 0.0}) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: gapX, vertical: gapY));
  }

  static Padding screen(BuildContext context) {
    return Padding(padding: GetInsets.paddingScreen(context));
  }

  static Padding contents(BuildContext context) {
    return Padding(padding: GetInsets.paddingContent(context));
  }

  static Padding contentSmall(BuildContext context) {
    return Padding(padding: GetInsets.paddingSmall(context));
  }

  static Padding contentMiddle(BuildContext context) {
    return Padding(padding: GetInsets.paddingMiddle(context));
  }

  static Padding contentLarge(BuildContext context) {
    return Padding(padding: GetInsets.paddingLarge(context));
  }

  static Padding contentBottom(BuildContext context) {
    return Padding(padding: GetInsets.paddingBottom(context));
  }
}
