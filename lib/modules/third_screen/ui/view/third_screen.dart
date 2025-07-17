import 'package:flutter/material.dart';
import 'package:suit_media_project/core/ui/basic_layout/responsive_layout.dart';
import 'package:suit_media_project/modules/third_screen/ui/view/third_screen_mobile.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: ThirdScreenMobile());
  }
}
