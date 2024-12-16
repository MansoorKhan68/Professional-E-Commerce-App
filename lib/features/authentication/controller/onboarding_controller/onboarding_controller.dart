import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khyber_kart/features/authentication/screens/login/login_screen.dart';

class OnBoardingContoller extends GetxController {
  static OnBoardingContoller get instance => Get.find();
  /* --------- VARIABLES ----------- */
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  /* --------- Update current page when page scroll ---------*/
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /* --------- Jump to specific dot selected page ---------*/
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /* --------- Update current index and jump to the next page ---------*/

  void nextPage() {
    if (currentPageIndex.value == 2) {
      // create get storage
      final storage = GetStorage();
      storage.write("isFirstTime", false);
      Get.offAll(() => LoginScreen());
      if (kDebugMode) {
        print("========================= GET STORAGE ====================");
        print(storage.read('isFirstTime'));
      }
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /* --------- Update current index and jump to the last page ---------*/

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
