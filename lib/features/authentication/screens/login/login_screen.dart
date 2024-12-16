import 'package:flutter/material.dart';
import 'package:khyber_kart/commons/styles/spacing_style.dart';
import 'package:khyber_kart/features/authentication/screens/login/widgets/form_divider.dart';
import 'package:khyber_kart/features/authentication/screens/login/widgets/login_form.dart';
import 'package:khyber_kart/features/authentication/screens/login/widgets/login_header.dart';
import 'package:khyber_kart/features/authentication/screens/login/widgets/social_buttons.dart';
import 'package:khyber_kart/utils/constants/sizes.dart';
import 'package:khyber_kart/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              /* --------- logo, title, and sub-title -----------*/
              LoginHeader(dark: dark),
              /* --------- FORM -----------*/
              LoginForm(),

              /// Divider
              FormDivider(dark: dark),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Footer
              SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
