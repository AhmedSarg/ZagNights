import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/common/widget/app_button.dart';

import '../../common/validators/validators.dart';
import '../../common/widget/main_text_field.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';
import '../viewmodel/register_layout_viewmodel.dart';

class RegisterContactPage extends StatelessWidget {
  const RegisterContactPage({
    super.key,
    required this.viewModel,
    required this.formKey,
    required this.emailFocusNode,
    required this.phoneNumberFocusNode,
  });

  final RegisterLayoutViewModel viewModel;

  final GlobalKey<FormState> formKey;

  final FocusNode emailFocusNode;
  final FocusNode phoneNumberFocusNode;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (popped) {
        viewModel.prevPage();
      },
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                AppStrings.registerContactPageTitle.tr(),
                style: AppTextStyles.registerPagesTitleTextStyle(context),
              ),
              const Spacer(),
              CustomTextField(
                label: AppStrings.registerContactPageEmailLabel.tr(),
                controller: viewModel.getEmailController,
                focusNode: emailFocusNode,
                nextFocus: phoneNumberFocusNode,
                keyboardType: TextInputType.emailAddress,
                validator: AppValidators.validateEmail,
              ),
              const SizedBox(height: AppSize.s30),
              CustomTextField(
                label: AppStrings.registerContactPagePhoneNumberLabel.tr(),
                controller: viewModel.getPhoneNumberController,
                focusNode: phoneNumberFocusNode,
                nextFocus: null,
                keyboardType: TextInputType.number,
                validator: AppValidators.validatePhoneNumber,
              ),
              const Spacer(),
              AppButton(
                text: AppStrings.registerContactPageButton.tr(),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    viewModel.nextPage();
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
