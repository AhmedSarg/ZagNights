import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/base/cubit_builder.dart';
import 'package:zag_nights/presentation/base/cubit_listener.dart';
import 'package:zag_nights/presentation/common/widget/app_button.dart';
import 'package:zag_nights/presentation/login_screen/viewmodel/login_viewmodel.dart';
import 'package:zag_nights/presentation/resources/routes_manager.dart';

import '../../../app/sl.dart';
import '../../base/base_states.dart';
import '../../common/validators/validators.dart';
import '../../common/widget/main_text_field.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.background,
            fit: BoxFit.cover,
            height: AppSize.infinity,
            width: AppSize.infinity,
          ),
          SafeArea(
            child: BlocProvider(
              create: (_) => LoginViewModel(sl())..start(),
              child: BlocConsumer<LoginViewModel, BaseStates>(
                listener: (context, state) {
                  if (state is SuccessState) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.homeRoute,
                      ModalRoute.withName('/'),
                    );
                  } else if (state is ErrorState) {
                    Navigator.pop(context);
                  }
                  baseListener(context, state);
                },
                builder: (context, state) {
                  return baseBuilder(
                    context,
                    state,
                    _buildContent(
                      context,
                      LoginViewModel.get(context),
                      GlobalKey<FormState>(),
                      FocusNode(),
                      FocusNode(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    LoginViewModel viewModel,
    GlobalKey<FormState> formKey,
    FocusNode emailFocusNode,
    FocusNode passwordFocusNode,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                child: Image.asset(ImageAssets.logoLight),
              ),
            ),
            const Spacer(),
            CustomTextField(
              label: AppStrings.loginScreenEmailLabel.tr(),
              controller: viewModel.getEmailController,
              focusNode: emailFocusNode,
              validator: AppValidators.validateLogin,
              nextFocus: passwordFocusNode,
            ),
            const SizedBox(height: AppSize.s30),
            CustomTextField(
              label: AppStrings.loginScreenPasswordLabel.tr(),
              controller: viewModel.getPasswordController,
              focusNode: passwordFocusNode,
              obscureText: true,
              validator: AppValidators.validateLogin,
              nextFocus: null,
            ),
            const Spacer(),
            AppButton(
              text: AppStrings.loginScreenLoginButton.tr(),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  viewModel.login();
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
