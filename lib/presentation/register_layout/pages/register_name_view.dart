import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/resources/font_manager.dart';
import 'package:zag_nights/presentation/resources/styles_manager.dart';

import '../../common/validators/validators.dart';
import '../../common/widget/main_text_field.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class RegisterNamePage extends StatefulWidget {
  const RegisterNamePage({super.key});

  @override
  State<RegisterNamePage> createState() => _RegisterNamePageState();
}

class _RegisterNamePageState extends State<RegisterNamePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();

    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Form(
        key: _formKey,
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
              controller: _firstNameController,
              focusNode: _firstNameFocusNode,
              nextFocus: _lastNameFocusNode,
              validator: AppValidators.validateName,
            ),
            const SizedBox(height: AppSize.s30),
            CustomTextField(
              label: AppStrings.registerNameScreenLastNameLabel.tr(),
              controller: _lastNameController,
              focusNode: _lastNameFocusNode,
              nextFocus: null,
              validator: AppValidators.validateName,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: AppSize.s50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                  }
                },
                child: Text(
                  AppStrings.registerNameScreenButton.tr(),
                  style: AppTextStyles.registerNameScreenButtonTextStyle(context),
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
