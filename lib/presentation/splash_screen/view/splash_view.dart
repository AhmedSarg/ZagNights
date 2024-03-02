import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../states/splash_states.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashViewModel>(
      create: (_) => SplashViewModel(context)..start(),
      child: BlocConsumer<SplashViewModel, BaseStates>(
        listener: (context, state) {
          if (state is SplashNavigateState) {
            Navigator.pushReplacementNamed(context, Routes.selectionRoute);
          } else {
            baseListener(context, state);
          }
        },
        builder: (context, state) =>
            baseBuilder(context, state, _buildContent(context)),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p80),
          child: Image.asset(
            ImageAssets.logoDark,
          ),
        ),
      ),
    );
  }
}
