import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TLoaders {
  /// Show a snackbar with a warning message.
  static void warningSnackBar({required String title, String? message}) {
    Get.snackbar(
      title,
      message ?? 'Please check your internet connection.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
  }

  /// Show a loading dialog with an optional message.
  static void showLoading({String? message}) {
    Get.dialog(
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (message != null) ...[
              const SizedBox(height: 10),
              Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Hide the loading dialog.
  static void hideLoading() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
