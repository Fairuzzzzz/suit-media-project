import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:suit_media_project/core/routes/routes.dart';

class SecondScreenController extends GetxController {
  final RxString userName = ''.obs;
  final RxString selectedUsername = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Map) {
      if (Get.arguments['name'] != null) {
        userName.value = Get.arguments['name'];
      }
    }
  }

  void navigateToUserSelection() async {
    final result = await Get.toNamed(Routes.thirdPage);
    if (result != null) {
      selectedUsername.value = "${result.firstName} ${result.lastName}";
    }
  }
}
