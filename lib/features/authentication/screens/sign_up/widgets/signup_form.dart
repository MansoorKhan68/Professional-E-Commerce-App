import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khyber_kart/features/authentication/screens/sign_up/widgets/signup_terms_and_conditions.dart';
import 'package:khyber_kart/utils/constants/sizes.dart';
import 'package:khyber_kart/utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
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
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// username
        TextFormField(
          expands: false,
          decoration: InputDecoration(
              labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// Email
        TextFormField(
          expands: false,
          decoration: InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// phone number
        TextFormField(
          expands: false,
          decoration: InputDecoration(
              labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// password
        TextFormField(
          expands: false,
          decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
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
              onPressed: () {}, child: Text(TTexts.createAccount)),
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    ));
  }
}
