import 'package:flutter/material.dart';
import 'package:suit_media_project/core/ui/basic_layout/responsive_layout.dart';
import 'package:suit_media_project/modules/second_screen/ui/view/second_screen_mobile.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: SecondScreenMobile());
  }
}
