import 'package:flutter/material.dart';
import 'package:flutter_farm_map/app/helper/config/color.config.dart';
import 'package:flutter_farm_map/app/helper/config/dimens.config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ButtonPress extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final IconData? icon;
  final double? widthIcon;
  final double borderRadius;
  final Color backgroundColor;
  // new property
  final bool isActive;
  final bool isLoading;
  final Color? bgLoadingColor;
  final Color? circularLoadingColor;
  final bool isWrap;
  final FontType fontType;
  final ButtonType buttonType;
  final double padY;
  final double padX;
  final Color colorText;
  final Color colorIcon;

  const ButtonPress({
    super.key,
    this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius = 10,
    this.backgroundColor = const Color(0xFFFFC502),
    this.icon,
    this.widthIcon = 20,
    this.style,
    // new property
    this.isActive = true,
    this.isLoading = false,
    this.bgLoadingColor,
    this.circularLoadingColor,
    this.isWrap = false,
    this.fontType = FontType.semiBold,
    this.buttonType = ButtonType.regular,
    this.padY = 12,
    this.padX = 0,
    this.colorText = const Color(0xFF212121),
    this.colorIcon = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: IntrinsicWidth(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: (isActive) ? backgroundColor : ColorApps.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
          ),
          onPressed: (isLoading || !isActive) ? () {} : () => onPressed.call(),
          child: icon == null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLoading) ...[
                      SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          color: circularLoadingColor ?? ColorApps.white,
                          strokeWidth: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    Text(
                      text ?? '',
                      style: style?.copyWith(
                            color: isActive ? colorText : ColorApps.white,
                          ) ??
                          headingSemi4.copyWith(
                            color: isActive ? colorText : ColorApps.white,
                          ),
                    ),
                  ],
                )
              : text == null
                  ? Center(
                      child: FaIcon(
                        icon!,
                        size: widthIcon,
                        color: colorIcon,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: FaIcon(
                            icon!,
                            size: widthIcon,
                            color: isActive ? colorText : ColorApps.white,
                          ),
                        ),
                        Visibility(
                          visible: text != null ? true : false,
                          child: Text(
                            text ?? '',
                            style: style?.copyWith(
                                  color: isActive ? colorText : ColorApps.white,
                                ) ??
                                headingSemi4.copyWith(
                                  color: isActive ? colorText : ColorApps.white,
                                ),
                          ),
                        )
                      ],
                    ),
        ),
      ),
    );
  }
}

enum FontType { regular, semiBold, bold }

enum ButtonType { regular, dialog }
