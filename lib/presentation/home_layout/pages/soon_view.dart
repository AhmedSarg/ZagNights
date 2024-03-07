import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/home_layout/viewmodel/home_layout_viewmodel.dart';

import '../../common/widget/app_button.dart';
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
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    Image.asset(ImageAssets.logoLight),
                    const SizedBox(height: AppSize.s10),
                    Text(
                      AppStrings.soonScreenTitle.tr(),
                      style: AppTextStyles.soonScreenTitleTextStyle(context),
                    ),
                    const Spacer(flex: 3),
                    AppButton(
                      text: AppStrings.soonScreenLogOut.tr(),
                      onPressed: () {
                        HomeLayoutViewModel.get(context).logout();
                      },
                      outlined: true,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
