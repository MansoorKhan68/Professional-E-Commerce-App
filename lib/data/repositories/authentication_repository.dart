import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khyber_kart/features/authentication/screens/onboarding_screen/onboarding_screen.dart';
import 'package:khyber_kart/features/authentication/screens/login/login_screen.dart';
import 'package:khyber_kart/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:khyber_kart/utils/exceptions/firebase_exceptions.dart';
import 'package:khyber_kart/utils/exceptions/format_exceptions.dart';
import 'package:khyber_kart/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /* ----------- VARIABLES ------------*/
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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

  /* ---------------- Email & password Sign in --------------------*/
  // [email authentication] - sign-in
  // [email authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [Re authenticate] - Re authenticate user
  // [email authentication] - Forget password

  /* ---------------- Faderated identity & social sign-in --------------------*/
  // [Google authentication] - Google
  // [Facebook authentication] - Facebook
}
