import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khyber_kart/features/authentication/screens/onboarding_screen/onboarding_screen.dart';
import 'package:khyber_kart/features/authentication/screens/login/login_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /* ----------- VARIABLES ------------*/
  final deviceStorage = GetStorage();

  /* ------ Call from main.dart on app launch -------*/
  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /* ---------- Function to show relavent screen -----------*/
  screenRedirect() async {
    if (kDebugMode) {
      print("========================= GET STORAGE ====================");
      print(deviceStorage.read('isFirstTime'));
    }
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }
}
