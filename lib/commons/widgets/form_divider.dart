import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khyber_kart/utils/constants/colors.dart';
import 'package:khyber_kart/utils/constants/text_strings.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: dark ? TColors.darkGrey : TColors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text(
          TTexts.orSignInWith.capitalize!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(
            child: Divider(
          color: dark ? TColors.darkGrey : TColors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        )),
      ],
    );
  }
}