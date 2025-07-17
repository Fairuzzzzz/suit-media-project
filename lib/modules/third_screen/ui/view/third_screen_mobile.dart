import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:suit_media_project/core/ui/theme/custom_color.dart';
import 'package:suit_media_project/core/ui/widgets/appbar/primary_appbar.dart';
import 'package:suit_media_project/modules/third_screen/controller/third_screen_controller.dart';

class ThirdScreenMobile extends StatelessWidget {
  const ThirdScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThirdScreenController());

    return Scaffold(
      backgroundColor: CustomColor.lightBackgroundColor,
      appBar: PrimaryAppBar('Third Screen', showBackButton: true),
    );
  }
}
