import 'package:flutter/material.dart';
import 'package:khyber_kart/features/authentication/controller/onboarding_controller/onboarding_controller.dart';
import 'package:khyber_kart/utils/constants/sizes.dart';
import 'package:khyber_kart/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
            onPressed: () {
              OnBoardingContoller.instance.skipPage();
            },
            child: Text(
              "Skip",
              style: Theme.of(context).textTheme.bodyMedium,
            )));
  }
}
