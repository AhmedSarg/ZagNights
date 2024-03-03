import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/validators/validators.dart';
import '../../common/widget/main_text_field.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';
import '../viewmodel/register_layout_viewmodel.dart';

class RegisterNamePage extends StatelessWidget {
  const RegisterNamePage({
    super.key,
    required this.viewModel,
    required this.formKey,
    required this.firstNameFocusNode,
    required this.lastNameFocusNode,
  });

  final RegisterLayoutViewModel viewModel;

  final GlobalKey<FormState> formKey;

  final FocusNode firstNameFocusNode;
  final FocusNode lastNameFocusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              AppStrings.registerNameScreenTitle.tr(),
              style: AppTextStyles.registerNameScreenTitleTextStyle(context),
            ),
            const Spacer(),
            CustomTextField(
              label: AppStrings.registerNameScreenFirstNameLabel.tr(),
              controller: viewModel.getFirstNameController,
              focusNode: firstNameFocusNode,
              nextFocus: lastNameFocusNode,
              validator: AppValidators.validateName,
            ),
            const SizedBox(height: AppSize.s30),
            CustomTextField(
              label: AppStrings.registerNameScreenLastNameLabel.tr(),
              controller: viewModel.getLastNameController,
              focusNode: lastNameFocusNode,
              nextFocus: null,
              validator: AppValidators.validateName,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: AppSize.s50,
              child: ElevatedButton(
                onPressed: () {
                  firstNameFocusNode.unfocus();
                  lastNameFocusNode.unfocus();
                  if (formKey.currentState!.validate()) {
                    viewModel.nextPage();
                  }
                },
                child: Text(
                  AppStrings.registerNameScreenButton.tr(),
                  style:
                      AppTextStyles.registerNameScreenButtonTextStyle(context),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
