import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suit_media_project/core/ui/size/dimensions.dart';
import 'package:suit_media_project/core/ui/theme/custom_color.dart';
import 'package:suit_media_project/core/ui/widgets/appbar/back_button_widget.dart';
import 'package:suit_media_project/core/ui/widgets/text_label/title_heading2_widget.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final double elevation;
  final List<Widget>? actions;
  final Widget? leading;
  final bool autoLeading;
  final bool showBackButton;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? appbarSize;

  final VoidCallback? onTap;

  const PrimaryAppBar(
    this.title, {
    super.key,
    this.backgroundColor,
    this.elevation = 0,
    this.autoLeading = false,
    this.showBackButton = false,
    this.centerTitle = true,
    this.actions,
    this.leading,
    this.bottom,
    this.toolbarHeight,
    this.appbarSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: TitleHeading2Widget(
        text: title,
        fontSize: 16.sp,
        color: CustomColor.darkFontColor,
      ),
      actions: actions,
      leading: showBackButton
          ? BackButtonWidget(
              onTap:
                  onTap ??
                  () {
                    Get.back();
                  },
            )
          : null,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      scrolledUnderElevation: 0,
      backgroundColor: CustomColor.lightBackgroundColor,
      automaticallyImplyLeading: autoLeading,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appbarSize ?? Dimensions.appBarHeight);
}
