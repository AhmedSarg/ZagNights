import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/domain/usecase/login_usecase.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';
import 'package:zag_nights/presentation/base/base_states.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';

class LoginViewModel extends BaseCubit
    implements LoginViewModelInput, LoginViewModelOutput {
  static LoginViewModel get(context) => BlocProvider.of(context);

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void start() {}

  void login() {
    emit(LoadingState(displayType: DisplayType.popUpDialog));
    _loginUseCase(
      LoginUseCaseInput(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    ).then(
      (value) {
        value.fold(
          (l) {
            emit(ErrorState(failure: l, displayType: DisplayType.popUpDialog));
          },
          (r) {
            emit(SuccessState(AppStrings.loginScreenSuccessMessage.tr()));
          },
        );
      },
    );
  }

  @override
  TextEditingController get getEmailController => _emailController;

  @override
  TextEditingController get getPasswordController => _passwordController;
}

abstract class LoginViewModelInput {}

abstract class LoginViewModelOutput {
  TextEditingController get getEmailController;

  TextEditingController get getPasswordController;
}
