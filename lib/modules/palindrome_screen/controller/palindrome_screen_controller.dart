import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/state_manager.dart';
import 'package:suit_media_project/core/ui/theme/custom_color.dart';

class PalindromeScreenController extends GetxController {
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  final RxBool isChecking = false.obs;
  final RxString result = ''.obs;
  final RxBool isValid = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    palindromeController.dispose();
    super.onClose();
  }

  bool validateInput() {
    if (palindromeController.text.trim().isEmpty) {
      _showSnackbar(
        'Error',
        'Please enter text to check',
        CustomColor.grayColor,
      );
      return false;
    }
    return true;
  }

  void checkPalindrome() {
    if (!validateInput()) return;

    isChecking.value = true;

    final isPalindromeText = _isPalindrome(palindromeController.text);
    result.value = isPalindromeText ? 'Is Palindrome' : 'Not a Palindrome';
    isValid.value = isPalindromeText;
    _showResultSnackbar();
    isChecking.value = false;
  }

  bool _isPalindrome(String input) {
    String cleanedInput = input.toLowerCase().replaceAll(
      RegExp(r'[^a-z0-9]'),
      '',
    );

    if (cleanedInput.isEmpty) return false;
    String reversed = cleanedInput.split('').reversed.join();
    return cleanedInput == reversed;
  }

  void _showResultSnackbar() {
    _showSnackbar(
      isValid.value ? 'Success' : 'Failed',
      result.value,
      isValid.value ? CustomColor.primaryColor : CustomColor.grayColor,
    );
  }

  void _showSnackbar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: CustomColor.lightFontColor,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
    );
  }
}
