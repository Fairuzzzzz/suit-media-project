import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:suit_media_project/core/ui/theme/custom_color.dart';
import 'package:suit_media_project/core/ui/widgets/appbar/primary_appbar.dart';
import 'package:suit_media_project/core/ui/widgets/button/primary_button.dart';
import 'package:suit_media_project/core/ui/widgets/text_label/title_heading2_widget.dart';
import 'package:suit_media_project/core/ui/widgets/text_label/title_heading3_widget.dart';
import 'package:suit_media_project/core/ui/widgets/text_label/title_heading5_widget.dart';
import 'package:suit_media_project/modules/second_screen/controller/second_screen_controller.dart';

class SecondScreenMobile extends StatelessWidget {
  const SecondScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SecondScreenController());

    return Scaffold(
      backgroundColor: CustomColor.lightBackgroundColor,
      appBar: PrimaryAppBar('Second Screen', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleHeading5Widget(
                    text: 'Welcome',
                    fontWeight: FontWeight.w300,
                  ),
                  TitleHeading3Widget(
                    text: controller.userName.value.isEmpty
                        ? "Selected User Name"
                        : controller.userName.value,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: TitleHeading2Widget(
                    text: controller.userName.value.isEmpty
                        ? "Selected User Name"
                        : controller.userName.value,
                  ),
                ),
              ),
              PrimaryButton(
                title: "Choose a User",
                onPressed: () {},
                buttonColor: CustomColor.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
