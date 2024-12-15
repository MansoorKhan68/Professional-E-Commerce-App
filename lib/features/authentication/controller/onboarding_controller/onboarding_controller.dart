import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      // Get.to(LoginScreen());
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
