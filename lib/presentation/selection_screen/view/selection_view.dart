import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  SizedBox(
                    width: AppSize.infinity,
                    height: AppSize.s50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.loginRoute);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                      ),
                      child: Text(
                        AppStrings.selectionScreenLoginButton.tr(),
                        style: AppTextStyles.selectionScreenLoginButtonTextStyle(context),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s20),
                  SizedBox(
                    width: AppSize.infinity,
                    height: AppSize.s50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerRoute);
                      },
                      style: TextButton.styleFrom(
                        side: const BorderSide(
                          color: ColorManager.white,
                          width: AppSize.s1,
                        ),
                      ),
                      child: Text(
                        AppStrings.selectionScreenRegisterButton.tr(),
                        style: AppTextStyles.selectionScreenRegisterButtonTextStyle(context),
                      ),
                    ),
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
