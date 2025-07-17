import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:suit_media_project/core/routes/routes.dart';
import 'package:suit_media_project/modules/palindrome_screen/ui/view/palindrome_screen.dart';

class RoutesPagesList {
  static var list = [
    GetPage(name: Routes.palindromePage, page: () => const PalindromScreen()),
  ];
}
