import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimensions {
  // Screen Size
  static double mobileScreenWidth = 575;
  static double tabletScreenWidth = 1100;

  // Padding and Margin
  static double paddingHorizontalSize = 24.00.w;
  static double paddingVerticalSize = 24.00.h;
  static double marginBetweenInputTitleAndBox = 8.h;
  static double marginBetweenInputBox = 16.h;
  static double marginSizeHorizontal = 24.00.w;
  static double marginSizeVertical = 24.00.h;
  static double marginSizeBetweenColumn = 16.00.w;

  // Widget Size
  static double buttonHeight = 56.00.h;
  static double inputBoxHeight = 56.00.h;
  static double appBarHeight = 64.00.h;

  static double iconSizeSmall = 8.00.h;
  static double iconSizeMedium = 16.00.h;
  static double iconSizeLarge = 24.00.h;

  // Typography size
  static double headingTextSize1 = 24.00.sp;
  static double headingTextSize2 = 20.00.sp;
  static double headingTextSize3 = 16.00.sp;
  static double headingTextSize4 = 14.00.sp;
  static double headingTextSize5 = 12.00.sp;
  static double headingTextSize6 = 10.00.sp;

  // Radius size
  static double radius = 10.00.r;

  // Default height and width size
  static double heightSize = 12.00.h;
  static double widthSize = 10.00.w;

  double switchOnTablet(
    BuildContext context, {
    required double ifTrue,
    required double ifFalse,
  }) {
    final isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    return (isTablet) ? ifTrue : ifFalse;
  }

  double screenWidthPortion(
    BuildContext context, {
    required double ifTablet,
    required double ifNotTablet,
  }) {
    return MediaQuery.sizeOf(context).width *
        switchOnTablet(context, ifTrue: ifTablet, ifFalse: ifNotTablet);
  }

  double horizontalPaddingMultiplied(
    BuildContext context, {
    required double ifTablet,
    required double ifNotTablet,
  }) {
    return Dimensions.paddingHorizontalSize *
        switchOnTablet(context, ifTrue: ifTablet, ifFalse: ifNotTablet);
  }
}
