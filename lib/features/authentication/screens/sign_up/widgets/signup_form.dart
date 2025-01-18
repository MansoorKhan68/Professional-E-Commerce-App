import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khyber_kart/features/authentication/controller/sign_up_controller.dart';
import 'package:khyber_kart/features/authentication/screens/sign_up/widgets/signup_terms_and_conditions.dart';
import 'package:khyber_kart/utils/constants/sizes.dart';
import 'package:khyber_kart/utils/constants/text_strings.dart';
import 'package:khyber_kart/utils/validators/validation.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
        key: controller.signUpFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) => TValidator.validEmptyText(
                        'First name', value.toString()),
                    controller: controller.firstName,
                    expands: false,
                    decoration: InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) => TValidator.validEmptyText(
                        'Last name', value.toString()),
                    controller: controller.lastName,
                    expands: false,
                    decoration: InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// username
            TextFormField(
               keyboardType: TextInputType.text,
              validator: (value) =>
                  TValidator.validEmptyText('Username', value.toString()),
              controller: controller.userName,
              expands: false,
              decoration: InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// Email
            TextFormField(
               keyboardType: TextInputType.emailAddress,
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              expands: false,
              decoration: InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// phone number
            TextFormField(
               keyboardType: TextInputType.phone,
              validator: (value) => TValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              expands: false,
              decoration: InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            /// password
            Obx(
              () => TextFormField(
                 keyboardType: TextInputType.visiblePassword,
                  validator: (value) => TValidator.validatePassword(value),
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: controller.hidePassword.value
                            ? Icon(Iconsax.eye_slash)
                            : Icon(Iconsax.eye),
                      ))),
            ),
            SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            /* ---------- TERMS & CONDITIONS CHECK -----------*/

            SignUpTermsAndConditions(),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Sign up button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: Text(TTexts.createAccount)),
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ));
  }
}
