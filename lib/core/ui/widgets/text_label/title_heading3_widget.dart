import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suit_media_project/core/ui/theme/custom_style.dart';

class TitleHeading3Widget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final EdgeInsetsGeometry padding;
  final double opacity;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  static const paddingValue = EdgeInsets.all(0.0);

  const TitleHeading3Widget({
    super.key,
    required this.text,
    this.textAlign,
    this.textOverflow,
    this.padding = paddingValue,
    this.opacity = 1.0,
    this.maxLines,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: padding,
        child: Text(
          text.tr,
          style: Get.isDarkMode
              ? CustomStyle.lightHeading3TextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: color,
                )
              : CustomStyle.darkHeading3TextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: color,
                ),
          textAlign: textAlign,
          overflow: textOverflow,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
