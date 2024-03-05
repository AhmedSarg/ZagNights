import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/enums.dart';
import '../../common/validators/validators.dart';
import '../../common/widget/app_button.dart';
import '../../common/widget/main_text_field.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';
import '../viewmodel/register_layout_viewmodel.dart';

class RegisterDetailsPage extends StatelessWidget {
  const RegisterDetailsPage(
      {super.key, required this.viewModel, required this.formKey});

  final RegisterLayoutViewModel viewModel;
  final GlobalKey<FormState> formKey;

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
                AppStrings.registerDetailsPageTitle.tr(),
                style: AppTextStyles.registerPagesTitleTextStyle(context),
              ),
              const Spacer(),
              FormField(
                validator: (value) {
                  if (viewModel.getGender == null) {
                    return AppStrings.validationsFieldRequired.tr();
                  }
                  return null;
                },
                initialValue: null,
                builder: (context) {
                  return GenderSelector(
                      viewModel: viewModel, error: context.errorText);
                },
              ),
              const SizedBox(height: AppSize.s30),
              CustomTextField(
                controller: viewModel.getAgeController,
                focusNode: FocusNode(),
                validator: AppValidators.validateAge,
                label: AppStrings.registerDetailsPageAgeLabel.tr(),
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              AppButton(
                text: AppStrings.registerDetailsPageButton.tr(),
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

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.viewModel,
    required this.error,
  });

  final RegisterLayoutViewModel viewModel;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppSize.s50,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.white, width: AppSize.s1),
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: [
              GenderTile(
                viewModel: viewModel,
                gender: Gender.male,
              ),
              const VerticalDivider(
                thickness: AppSize.s1,
                width: AppSize.s1,
                color: ColorManager.white,
              ),
              GenderTile(
                viewModel: viewModel,
                gender: Gender.female,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.s8),
        error == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Text(
                  error!,
                  style: getThinStyle(
                    color: Colors.red.withOpacity(.7),
                  ),
                ),
              ),
      ],
    );
  }
}

class GenderTile extends StatelessWidget {
  const GenderTile({
    super.key,
    required this.viewModel,
    required this.gender,
  });

  final RegisterLayoutViewModel viewModel;
  final Gender gender;

  @override
  Widget build(BuildContext context) {
    bool selected = viewModel.getGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          viewModel.setGender(gender);
        },
        child: Container(
          height: AppSize.infinity,
          color: selected ? ColorManager.white : ColorManager.transparent,
          alignment: Alignment.center,
          child: Text(
            gender == Gender.male
                ? AppStrings.registerDetailsPageMale.tr()
                : AppStrings.registerDetailsPageFemale.tr(),
            style: AppTextStyles.registerDetailsPageGenderTextStyle(
              context,
              selected ? ColorManager.primary : ColorManager.white,
            ),
          ),
        ),
      ),
    );
  }
}
