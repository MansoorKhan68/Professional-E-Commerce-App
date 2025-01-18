
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khyber_kart/data/repositories/authentication_repository.dart';
import 'package:khyber_kart/data/repositories/user/user_repository.dart';
import 'package:khyber_kart/features/authentication/model/user_model.dart';
import 'package:khyber_kart/features/authentication/screens/login/dumy.dart';
import 'package:khyber_kart/features/authentication/screens/sign_up/verify_email.dart';
import 'package:khyber_kart/utils/constants/colors.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  /* ------------ VARIABLES ------------- */
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /* -------- SIGNUP -----------*/
  void signup() async {
    try {
      // loading
      // check internet connectivity
      // Form validation
      if (!signUpFormKey.currentState!.validate()) {
        return;
      }

      // Privacy policy check
      if (!privacyPolicy.value) {
        Get.snackbar(
          colorText: TColors.textWhite,
          backgroundColor: TColors.warning,
          'Accept Privacy Policy',
            'In order to create account, you must have read and accept the Privacy Policy & Terms of Use');
      }
      // Register user in the Firebase authentication & save user data in the firestore
    final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      // save authecticated user data into firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
         firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
           username: userName.text.trim(),
            email: email.text.trim(),
             phoneNumber: phoneNumber.text.trim(),
              // profilePicture: '',
              
              );
      final UserRepository userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);
      // success message
       Get.snackbar(
          colorText: TColors.textWhite,
          backgroundColor: TColors.warning,
          'Congretulations',
            'Your account has been created! Verify email to continue.');
      // move to verify screen
     Get.to(() => const VerifyEmailScreen());

      

    } catch (e) {
      Get.snackbar("Oh Snap!", e.toString());
    } 
  }
}
