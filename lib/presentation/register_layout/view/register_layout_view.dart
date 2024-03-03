import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/base/cubit_builder.dart';
import 'package:zag_nights/presentation/base/cubit_listener.dart';
import 'package:zag_nights/presentation/register_layout/pages/register_details_view.dart';
import 'package:zag_nights/presentation/register_layout/pages/register_name_view.dart';
import 'package:zag_nights/presentation/register_layout/viewmodel/register_layout_viewmodel.dart';

import '../../base/base_states.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

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
      default:
        return Scaffold(
          backgroundColor: ColorManager.black,
          body: Image.asset(
            ImageAssets.background,
            fit: BoxFit.cover,
            height: AppSize.infinity,
            width: AppSize.infinity,
          ),
        );
    }
  }
}
