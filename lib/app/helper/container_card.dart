import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? paddingContent;
  final EdgeInsets? marginContent;
  final double? width;
  final double? height;

  const ContainerCard({
    super.key,
    required this.child,
    this.paddingContent,
    this.marginContent,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginContent ?? const EdgeInsets.all(4),
      padding: paddingContent ?? const EdgeInsets.all(4),
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}
