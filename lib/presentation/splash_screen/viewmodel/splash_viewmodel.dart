import 'package:flutter/cupertino.dart';

import '../../base/base_cubit.dart';
import '../../resources/assets_manager.dart';
import '../states/splash_states.dart';

class SplashViewModel extends BaseCubit
    implements SplashViewModelInput, SplashViewModelOutput {
  final BuildContext _context;

  SplashViewModel(this._context);

  @override
  void start() async {
    await _loadImages(_context);
    emit(SplashNavigateState());
  }
}

Future<void> _loadImages(BuildContext context) async {
  if (context.mounted) {
    await precacheImage(const AssetImage(ImageAssets.background), context);
  }
  if (context.mounted) {
    await precacheImage(const AssetImage(ImageAssets.logoLight), context);
  }
}

abstract class SplashViewModelInput {}

abstract class SplashViewModelOutput {}
