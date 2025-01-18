import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khyber_kart/features/authentication/controller/sign_up_controller.dart';
import 'package:khyber_kart/utils/constants/colors.dart';
import 'package:khyber_kart/utils/constants/sizes.dart';
import 'package:khyber_kart/utils/constants/text_strings.dart';
import 'package:khyber_kart/utils/helpers/helper_functions.dart';

class SignUpTermsAndConditions extends StatelessWidget {
  const SignUpTermsAndConditions({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        SizedBox(
          width: TSizes.spaceBtwInputFields / 2,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: TTexts.iAgreeTo,
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.privacyPolicy,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: dark ? TColors.white : TColors.primary)),
          TextSpan(
              text: TTexts.and, style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.termsOfUse,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: dark ? TColors.white : TColors.primary)),
        ]))
      ],
    );
  }
}
