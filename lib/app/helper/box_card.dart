import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/helper/config/color.config.dart';
import 'package:flutter_farm_map/app/helper/config/dimens.config.dart';
import 'package:flutter_farm_map/app/helper/config/padding.config.dart';
import 'package:flutter_farm_map/app/helper/image_frame.dart';


class BoxCard extends StatelessWidget {
  final String? imageUrl;
  final String? titleImage;
  final bool isImage;
  final List<Widget> children;
  final Function()? onTap;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets padding;
  final double gapYTop;
  final double gapYDown;
  final double? contentHeight;
  final double? contentWidth;
  final bool isShadow;
  final Color color;
  final double borderRadius;

  const BoxCard({
    super.key,
    this.imageUrl,
    this.isImage = false,
    required this.children,
    this.titleImage,
    this.onTap,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding = EdgeInsets.zero,
    this.gapYTop = 0,
    this.gapYDown = 0,
    this.contentHeight,
    this.isShadow = true,
    this.color = Colors.white,
    this.borderRadius = 5,
    this.contentWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: contentHeight,
      width: contentWidth,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, isShadow ? 0.1 : 0),
            spreadRadius: 0,
            blurRadius: isShadow ? 5 : 0,
            offset: Offset(0, isShadow ? 1 : 0),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Visibility(
              visible: isImage ? true : false,
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  ImageFrame(
                    isCache: true,
                    imageUrl: imageUrl,
                  ),
                  Visibility(
                    visible: titleImage == null ? false : true,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black38,
                              Colors.black54
                            ]),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Center(
                          child: Text(
                        titleImage ?? '',
                        style: headingB4.copyWith(color: ColorApps.white),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Paddings.itemsGapCustom(context, gapY: gapYTop),
            Padding(
              padding: padding,
              child: Column(
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: crossAxisAlignment,
                children: children,
              ),
            ),
            Paddings.itemsGapCustom(context, gapY: gapYDown),
          ],
        ),
      ),
    );
  }
}
