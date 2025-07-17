import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suit_media_project/core/ui/size/dimensions.dart';
import 'package:suit_media_project/core/ui/theme/custom_color.dart';
import 'package:suit_media_project/core/ui/theme/custom_style.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final double borderWidth;
  final double? radius;
  final double? height;
  final double? elevation;
  final int flex;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final OutlinedBorder? shape;
  final Widget? icon;
  final bool isExpanded;
  final double? fontSize;
  final FontWeight? fontWeight;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.borderWidth = 0,
    this.radius,
    this.height,
    this.elevation,
    this.flex = 1,
    this.buttonColor,
    this.buttonTextColor,
    this.shape,
    this.icon,
    this.isExpanded = false,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Expanded(flex: flex, child: _buildButton(context))
        : _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    return SizedBox(
      height: height ?? Dimensions.buttonHeight * 0.78,
      width: isExpanded ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          surfaceTintColor: CustomColor.transparentColor,
          elevation: elevation,
          shape:
              shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  radius ?? Dimensions.radius * 0.7,
                ),
              ),
          backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
          side: (onPressed != null)
              ? BorderSide(
                  width: borderWidth,
                  color: borderColor ?? Theme.of(context).primaryColor,
                )
              : null,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.w,
          children: [
            if (icon != null) icon!,
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: CustomStyle.darkHeading3TextStyle.copyWith(
                fontSize: fontSize,
                fontWeight: fontWeight ?? FontWeight.w600,
                color: buttonTextColor ?? CustomColor.lightFontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
