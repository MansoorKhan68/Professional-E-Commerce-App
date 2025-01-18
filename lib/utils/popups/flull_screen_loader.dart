import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khyber_kart/utils/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {
  /// Opens a full-screen loading dialog with a given text and animation.
  /// 
  /// Parameters:
  /// - [text]: The text to display in the loading dialog.
  /// - [animation]: The Lottie animation to display.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // Use Get.overlayContext for overlay dialogs.
      barrierDismissible: false, // Prevent dismissing by tapping outside.
      builder: (_) => PopScope(
        canPop: false, // Disable back button pop.
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250), // Adjust spacing as needed.
                SingleChildScrollView(
                  child: Column(
                    children: [
                      TAnimationLoaderWidget(
                        text: text,
                        animation: animation,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // stop loading
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
