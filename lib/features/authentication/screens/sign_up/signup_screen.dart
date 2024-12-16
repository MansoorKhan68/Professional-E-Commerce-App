import 'package:flutter/material.dart';
import 'package:khyber_kart/commons/widgets/form_divider.dart';
import 'package:khyber_kart/commons/widgets/social_buttons.dart';
import 'package:khyber_kart/features/authentication/screens/sign_up/widgets/signup_form.dart';
import 'package:khyber_kart/utils/constants/sizes.dart';
import 'package:khyber_kart/utils/constants/text_strings.dart';
import 'package:khyber_kart/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// title text
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// FORM
              SignUpForm(dark: dark),
              FormDivider(dark: dark, dividerText: TTexts.orSignUpWith),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
