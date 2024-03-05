import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.outlined = false,
  });

  final String text;
  final Function() onPressed;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s50,
      child: TextButton(
        onPressed: onPressed,
        style: outlined
            ? TextButton.styleFrom(
                side: const BorderSide(
                  color: ColorManager.white,
                  width: AppSize.s1,
                ),
              )
            : TextButton.styleFrom(
                backgroundColor: ColorManager.primary,
              ),
        child: Text(
          text,
          style: AppTextStyles.appButtonTextStyle(context),
        ),
      ),
    );
  }
}
