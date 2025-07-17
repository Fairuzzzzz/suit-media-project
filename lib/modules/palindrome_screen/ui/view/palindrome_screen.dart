import 'package:flutter/material.dart';
import 'package:suit_media_project/core/ui/basic_layout/responsive_layout.dart';
import 'package:suit_media_project/modules/palindrome_screen/ui/view/palindrome_screen_mobile.dart';

class PalindromScreen extends StatelessWidget {
  const PalindromScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: PalindromScreenMobile());
  }
}
