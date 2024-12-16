import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khyber_kart/commons/styles/spacing_style.dart';
import 'package:khyber_kart/features/authentication/screens/login/login_screen.dart';
import 'package:khyber_kart/utils/constants/sizes.dart';
import 'package:khyber_kart/utils/constants/text_strings.dart';
import 'package:khyber_kart/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  final String title, subTitle, image;
  final VoidCallback onpressed;
  const SuccessScreen(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              Image(
                  width: THelperFunctions.screenWidth() * 0.6,
                  image: AssetImage(image)),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Title & Sub-title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => LoginScreen()),
                    child: Text(TTexts.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
