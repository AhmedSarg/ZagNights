import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class SoonScreen extends StatelessWidget {
  const SoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.tertiary,
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.background,
            fit: BoxFit.cover,
            height: AppSize.infinity,
            width: AppSize.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p60),
                child: Text(
                  AppStrings.soonScreenTitle.tr(),
                  style: AppTextStyles.soonScreenTitleTextStyle(context),
                ),
              ),
              Lottie.asset(LottieAssets.comingSoonEn),
            ],
          ),
        ],
      ),
    );
  }
}
