import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class SecondScreenController extends GetxController {
  final RxString userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Map) {
      if (Get.arguments['name'] != null) {
        userName.value = Get.arguments['name'];
      }
    }
  }
}
