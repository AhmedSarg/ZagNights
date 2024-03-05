import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/register_layout/pages/register_contact_view.dart';
import 'package:zag_nights/presentation/register_layout/pages/register_job_view.dart';
import 'package:zag_nights/presentation/register_layout/pages/register_password_view.dart';

import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../pages/register_details_view.dart';
import '../pages/register_name_view.dart';
import '../pages/register_no_route_view.dart';
import '../viewmodel/register_layout_viewmodel.dart';

class RegisterLayoutScreen extends StatelessWidget {
  const RegisterLayoutScreen({super.key});

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
              create: (_) => RegisterLayoutViewModel()..start(),
              child: BlocConsumer<RegisterLayoutViewModel, BaseStates>(
                listener: (context, state) => baseListener(context, state),
                builder: (context, state) {
                  return baseBuilder(
                    context,
                    state,
                    _buildScreen(
                      context,
                      RegisterLayoutViewModel.get(context),
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

  Widget _buildScreen(BuildContext context, RegisterLayoutViewModel viewModel) {
    switch (viewModel.getIndex) {
      case 0:
        return RegisterNamePage(
          viewModel: viewModel,
          formKey: GlobalKey<FormState>(),
          firstNameFocusNode: FocusNode(),
          lastNameFocusNode: FocusNode(),
        );
      case 1:
        return RegisterDetailsPage(
          viewModel: viewModel,
          formKey: GlobalKey<FormState>(),
        );
      case 2:
        return RegisterContactPage(
          viewModel: viewModel,
          formKey: GlobalKey<FormState>(),
          emailFocusNode: FocusNode(),
          phoneNumberFocusNode: FocusNode(),
        );
      case 3:
        return RegisterJobPage(
          viewModel: viewModel,
          formKey: GlobalKey<FormState>(),
        );
      case 4:
        return RegisterPasswordPage(
          viewModel: viewModel,
          formKey: GlobalKey<FormState>(),
          passwordFocusNode: FocusNode(),
          confirmPasswordFocusNode: FocusNode(),
        );
      default:
        return RegisterNoRoutePage(viewModel: viewModel);
    }
  }
}
