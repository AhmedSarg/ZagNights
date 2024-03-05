import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/common/widget/app_button.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.background,
            fit: BoxFit.cover,
            height: AppSize.infinity,
            width: AppSize.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p60),
                    child: Image.asset(ImageAssets.logoLight),
                  ),
                  const Spacer(),
                  AppButton(
                    text: AppStrings.selectionScreenLoginButton.tr(),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                  ),
                  const SizedBox(height: AppSize.s20),
                  AppButton(
                    text: AppStrings.selectionScreenRegisterButton.tr(),
                    outlined: true,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerRoute);
                    },
                  ),
                  const SizedBox(height: AppSize.s20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
