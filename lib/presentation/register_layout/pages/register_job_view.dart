import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/widget/app_button.dart';
import '../../resources/color_manager.dart';
import '../../resources/langauge_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';
import '../viewmodel/register_layout_viewmodel.dart';

class RegisterJobPage extends StatelessWidget {
  const RegisterJobPage({
    super.key,
    required this.viewModel,
    required this.formKey,
  });

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
                AppStrings.registerJobPageTitle.tr(),
                style: AppTextStyles.registerPagesTitleTextStyle(context),
              ),
              const Spacer(),
              JobSelector(viewModel: viewModel),
              const Spacer(),
              AppButton(
                text: AppStrings.registerJobPageButton.tr(),
                onPressed: () {
                  viewModel.nextPage();
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

class JobSelector extends StatelessWidget {
  const JobSelector({
    super.key,
    required this.viewModel,
  });

  final RegisterLayoutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.transparent,
      child: InkWell(
        onTap: () {
          showJobsDialog(context);
        },
        splashColor: ColorManager.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(AppSize.s20),
        child: Container(
          height: AppSize.s50,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.white),
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  viewModel.getJob == null
                      ? AppStrings.registerJobPageJobLabel.tr()
                      : viewModel.getJob!,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textFieldLabelTextStyle(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showJobsDialog(BuildContext context) {

    final List<String> arabicJobs = [
      "بائع تجزئة",
      "ممثل خدمة عملاء",
      "ممرض",
      "طبيب",
      "محامي",
      "مدرس",
      "مهندس",
      "مطور برامج",
      "إختصاصي تسويق",
      "محاسب",
      "مصمم جرافيك",
      "مدير مشروع",
      "أخصائي الموارد البشرية",
      "محلل بيانات",
      "مدير مبيعات",
      "مدير تسويق",
      "محلل مالي",
      "مدير عمليات",
      "أخري"
    ];

    final List<String> englishJobs = [
      "Retail Salesperson",
      "Customer Service Representative",
      "Nurse",
      "Doctor",
      "Lawyer"
      "Teacher",
      "Engineer",
      "Software Developer",
      "Marketing Specialist",
      "Accountant",
      "Graphic Designer",
      "Project Manager",
      "Human Resources Specialist",
      "Data Analyst",
      "Sales Manager",
      "Marketing Manager",
      "Financial Analyst",
      "Operations Manager",
      "Other"
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Expanded(
          child: Text(
            AppStrings.registerJobPageDialogTitle.tr(),
            style: AppTextStyles.registerJobsDialogTitleTextStyle(context),
          ),
        ),
        backgroundColor: ColorManager.black,
        surfaceTintColor: ColorManager.tertiary,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: (AppLanguages.getCurrentLang(context) == Languages.en
                    ? englishJobs
                    : arabicJobs)
                .map(
                  (e) => ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      viewModel.setJob(e);
                    },
                    title: Text(
                      e,
                      style: AppTextStyles.registerJobsDialogItemTextStyle(
                          context),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
