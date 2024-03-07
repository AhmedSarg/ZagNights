import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/resources/color_manager.dart';
import 'package:zag_nights/presentation/resources/routes_manager.dart';

import '../../../app/sl.dart';
import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';
import '../pages/home_view.dart';
import '../pages/soon_view.dart';
import '../states/home_states.dart';
import '../viewmodel/home_layout_viewmodel.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      body: BlocProvider(
        create: (context) => HomeLayoutViewModel(sl(), sl())..start(),
        child: BlocConsumer<HomeLayoutViewModel, BaseStates>(
          listener: (context, state) {
            if (state is LogOutState) {
              Navigator.pushReplacementNamed(context, Routes.selectionRoute);
            }
            baseListener(context, state);
          },
          builder: (context, state) {
            if (state is SoonState) {
              return const SoonScreen();
            }
            else if (state is LoadingState) {
              return _buildLoading(context, baseBuilder(context, state, const SizedBox()));
            }
            else {
              return baseBuilder(context, state, _buildContent(context));
            }
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return const HomeScreen();
  }

  Widget _buildLoading(BuildContext context, Widget content) {
    return Stack(
      children: [
        Image.asset(
          ImageAssets.background,
          fit: BoxFit.cover,
          height: AppSize.infinity,
          width: AppSize.infinity,
        ),
        content,
      ],
    );
  }
}
