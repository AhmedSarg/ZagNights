import 'package:flutter/material.dart';

import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.appButtonTextStyle(context),
        ),
      ),
    );
  }
}
