import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khyber_kart/features/authentication/controller/onboarding_controller/onboarding_controller.dart';
import 'package:khyber_kart/utils/constants/colors.dart';
import 'package:khyber_kart/utils/constants/sizes.dart';
import 'package:khyber_kart/utils/device/device_utility.dart';
import 'package:khyber_kart/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight() / 2,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: dark ? TColors.primary : TColors.black),
          onPressed: () {
            OnBoardingContoller.instance.nextPage();
          },
          child: Icon(
            Iconsax.arrow_right_3,
            size: 32,
          ),
        ));
  }
}
