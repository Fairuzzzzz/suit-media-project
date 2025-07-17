import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:suit_media_project/core/ui/theme/custom_color.dart';
import 'package:suit_media_project/core/ui/widgets/button/primary_button.dart';
import 'package:suit_media_project/core/ui/widgets/form_field/primary_form_field.dart';
import 'package:suit_media_project/core/ui/widgets/layout/scaled_vertical_space.dart';
import 'package:suit_media_project/modules/palindrome_screen/controller/palindrome_screen_controller.dart';

class PalindromScreenMobile extends StatelessWidget {
  const PalindromScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PalindromeScreenController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 124,
                      height: 124,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/add_profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  ScaledVerticalSpace(48),
                  PrimaryFormField(
                    label: 'Name',
                    controller: controller.nameController,
                  ),
                  ScaledVerticalSpace(12),
                  PrimaryFormField(
                    label: 'Palindrome',
                    controller: controller.palindromeController,
                  ),
                  ScaledVerticalSpace(34),
                  PrimaryButton(
                    title: 'Check',
                    onPressed: controller.checkPalindrome,
                    buttonColor: CustomColor.primaryColor,
                  ),
                  ScaledVerticalSpace(12),
                  PrimaryButton(
                    title: "Next",
                    onPressed: () {},
                    buttonColor: CustomColor.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
