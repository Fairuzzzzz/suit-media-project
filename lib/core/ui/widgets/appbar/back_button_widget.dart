import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:suit_media_project/core/ui/size/dimensions.dart';
import 'package:suit_media_project/core/ui/theme/custom_color.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const BackButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions().horizontalPaddingMultiplied(
          context,
          ifTablet: .25,
          ifNotTablet: .5,
        ),
      ),
      icon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.radius *
                Dimensions().switchOnTablet(context, ifTrue: 10, ifFalse: 1.2),
          ),
          color: CustomColor.darkGrayColor,
        ),
        width: 12,
        height: 12,
        child: HeroIcon(HeroIcons.chevronLeft, color: CustomColor.grayColor),
      ),
    );
  }
}
