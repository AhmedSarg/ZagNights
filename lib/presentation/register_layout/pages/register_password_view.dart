import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/validators/validators.dart';
import '../../common/widget/app_button.dart';
import '../../common/widget/main_text_field.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';
import '../viewmodel/register_layout_viewmodel.dart';

class RegisterPasswordPage extends StatelessWidget {
  const RegisterPasswordPage({
    super.key,
    required this.viewModel,
    required this.formKey,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
  });

  final RegisterLayoutViewModel viewModel;
  final GlobalKey<FormState> formKey;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (popped) {
        viewModel.prevPage();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                AppStrings.registerPasswordPageTitle.tr(),
                style: AppTextStyles.registerPagesTitleTextStyle(context),
              ),
              const Spacer(),
              CustomTextField(
                label: AppStrings.registerPasswordPagePasswordLabel.tr(),
                controller: viewModel.getPasswordController,
                focusNode: passwordFocusNode,
                nextFocus: confirmPasswordFocusNode,
                obscureText: true,
                validator: AppValidators.validatePassword,
              ),
              const SizedBox(height: AppSize.s30),
              CustomTextField(
                label: AppStrings.registerPasswordPageConfirmPasswordLabel.tr(),
                controller: viewModel.getConfirmPasswordController,
                focusNode: confirmPasswordFocusNode,
                nextFocus: null,
                obscureText: true,
                validator: (val) {
                  return AppValidators.validateConfirmPassword(
                      val, viewModel.getPasswordController.text);
                },
              ),
              const Spacer(),
              AppButton(
                text: AppStrings.registerPasswordPageButton.tr(),
                onPressed: () {
                  passwordFocusNode.unfocus();
                  confirmPasswordFocusNode.unfocus();
                  if (formKey.currentState!.validate()) {
                    viewModel.register();
                  }
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
