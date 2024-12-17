import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khyber_kart/features/authentication/screens/login/forget_password/forget_password.dart';
import 'package:khyber_kart/features/authentication/screens/sign_up/signup_screen.dart';
import 'package:khyber_kart/utils/constants/sizes.dart';
import 'package:khyber_kart/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Form(
          child: Column(
        children: [
          /// email
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              label: Text(TTexts.email),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          // password
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              label: Text(TTexts.password),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields / 2,
          ),
          /* -------- Remember me and forget password -------- */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember me
              SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(value: true, onChanged: (value) {})),
              Text(TTexts.rememberMe),

              /// forget password
              Padding(
                padding:
                    const EdgeInsets.only(bottom: TSizes.spaceBtwItems / 4),
                child: TextButton(
                  onPressed: () => Get.to(() => ForgetPasswordScreen()),
                  child: Text(
                    TTexts.forgetPassword,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// sign In button

          SizedBox(
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: () {}, child: Text(TTexts.signIn))),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          /// create account button
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignupScreen());
                  },
                  child: Text(TTexts.createAccount))),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
        ],
      )),
    );
  }
}
