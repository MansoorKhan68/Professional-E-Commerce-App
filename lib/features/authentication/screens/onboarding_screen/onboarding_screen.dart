import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khyber_kart/features/authentication/controller/onboarding_controller/onboarding_controller.dart';
import 'package:khyber_kart/features/authentication/screens/onboarding_screen/widgets/onboarding_dot_navigation.dart';
import 'package:khyber_kart/features/authentication/screens/onboarding_screen/widgets/onboarding_next_button.dart';
import 'package:khyber_kart/features/authentication/screens/onboarding_screen/widgets/onboarding_page.dart';
import 'package:khyber_kart/features/authentication/screens/onboarding_screen/widgets/onboarding_skip.dart';
import 'package:khyber_kart/utils/constants/image_strings.dart';
import 'package:khyber_kart/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingContoller());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          OnBoardingSkip(),
          // Dot Navigation smoothPageIndicator
          OnBoardingNavigation(),

          // circular button
          OnBoardingNextButton()
        ],
      ),
    );
  }
}
