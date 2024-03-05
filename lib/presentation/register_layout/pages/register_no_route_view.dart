import 'package:flutter/material.dart';

import '../viewmodel/register_layout_viewmodel.dart';

class RegisterNoRoutePage extends StatelessWidget {
  const RegisterNoRoutePage({
    super.key,
    required this.viewModel,
  });

  final RegisterLayoutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (popped) {
        viewModel.prevPage();
      },
      child: const SizedBox(),
    );
  }
}
