import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/domain/models/enums.dart';
import 'package:zag_nights/presentation/common/validators/validators.dart';
import 'package:zag_nights/presentation/common/widget/app_button.dart';
import 'package:zag_nights/presentation/common/widget/main_text_field.dart';
import 'package:zag_nights/presentation/register_layout/viewmodel/register_layout_viewmodel.dart';
import 'package:zag_nights/presentation/resources/color_manager.dart';

import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

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
                AppStrings.registerDetailsScreenTitle.tr(),
                style: AppTextStyles.registerNameScreenTitleTextStyle(context),
              ),
              const Spacer(),
              GenderSelector(viewModel: viewModel),
              const SizedBox(height: AppSize.s30),
              CustomTextField(
                controller: viewModel.getAgeController,
                focusNode: FocusNode(),
                validator: AppValidators.validateAge,
                label: AppStrings.registerDetailsScreenAgeLabel.tr(),
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              AppButton(
                text: AppStrings.registerDetailsScreenButton.tr(),
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
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
  const GenderSelector({super.key, required this.viewModel});

  final RegisterLayoutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                ? AppStrings.registerDetailsScreenMale.tr()
                : AppStrings.registerDetailsScreenFemale.tr(),
            style: AppTextStyles.registerDetailsScreenGenderTextStyle(
              context,
              selected ? ColorManager.primary : ColorManager.white,
            ),
          ),
        ),
      ),
    );
  }
}
