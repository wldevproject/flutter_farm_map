import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/helper/config/icons.config.dart';

class ImageFrame extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final bool isCache;

  const ImageFrame({
    super.key,
    this.imageUrl,
    this.radius = 0,
    this.isCache = false,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: imageUrl == null || imageUrl == ''
          ? SizedBox(child: Image.asset(noImage))
          : ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: ExtendedImage(
                image: ExtendedResizeImage(
                  ExtendedNetworkImageProvider(imageUrl ?? '',
                      cache: isCache, scale: 1.0),
                ),
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
