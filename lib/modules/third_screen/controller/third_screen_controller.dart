import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:suit_media_project/modules/third_screen/models/third_screen_models.dart';
import 'package:suit_media_project/modules/third_screen/services/third_screen_services.dart';

class ThirdScreenController extends GetxController {
  final RxList<User> users = <User>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool hasMoreData = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  int currentPage = 1;
  final int perPage = 10;
  int totalPages = 1;

  final thirdScreenServices = ThirdScreenServices();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    if (isLoading.value || !hasMoreData.value) return;

    isLoading.value = true;
    hasError.value = false;

    try {
      final response = await thirdScreenServices.getUsers(
        page: currentPage,
        perPage: perPage,
      );

      totalPages = response.totalPages;

      users.addAll(response.data);

      hasMoreData.value = currentPage < totalPages;

      if (hasMoreData.value) {
        currentPage++;
      }
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshUsers() async {
    currentPage = 1;
    hasMoreData.value = true;
    users.clear();
    await fetchUsers();
  }

  void selectUser(User user) {
    Get.back(result: user);
  }
}
