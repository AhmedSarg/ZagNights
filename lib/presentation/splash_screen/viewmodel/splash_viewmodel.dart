import 'package:flutter/cupertino.dart';
import 'package:zag_nights/presentation/base/base_states.dart';

import '../../../domain/usecase/get_signed_user_usecase.dart';
import '../../base/base_cubit.dart';
import '../../resources/assets_manager.dart';
import '../states/splash_states.dart';

class SplashViewModel extends BaseCubit
    implements SplashViewModelInput, SplashViewModelOutput {
  final BuildContext _context;
  final GetSignedUserUseCase _signedUserUseCase;

  SplashViewModel(this._context, this._signedUserUseCase);

  @override
  void start() async {
    await _loadImages(_context);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        _signedUserUseCase(null).then(
          (value) {
            value.fold(
              (l) {
                ErrorState(
                  failure: l,
                  retry: () {
                    start();
                  },
                );
              },
              (r) {
                if (r == null) {
                  emit(UserNotSignedState());
                } else {
                  emit(UserSignedState());
                }
              },
            );
          },
        );
      },
    );
  }
}

Future<void> _loadImages(BuildContext context) async {
  if (context.mounted) {
    await precacheImage(const AssetImage(ImageAssets.background), context);
  }
  if (context.mounted) {
    await precacheImage(const AssetImage(ImageAssets.logoLight), context);
  }
  if (context.mounted) {
    await precacheImage(const AssetImage(ImageAssets.logoDark), context);
  }
}

abstract class SplashViewModelInput {}

abstract class SplashViewModelOutput {}
