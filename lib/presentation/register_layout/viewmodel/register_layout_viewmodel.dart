import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/domain/usecase/register_usecase.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';

import '../../../domain/models/enums.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';

class RegisterLayoutViewModel extends BaseCubit
    implements RegisterLayoutViewModelInput, RegisterLayoutViewModelOutput {
  static RegisterLayoutViewModel get(context) => BlocProvider.of(context);

  final RegisterUseCase _registerUseCase;

  RegisterLayoutViewModel(this._registerUseCase);

  int _index = 0;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  Gender? _gender;
  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? _job;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void start() {}

  void nextPage() {
    _index++;
    emit(InitState());
  }

  void prevPage() {
    _index--;
    emit(InitState());
  }

  void register() {
    emit(LoadingState(displayType: DisplayType.popUpDialog));
    _registerUseCase(
      RegisterUseCaseInput(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        gender: _gender == Gender.female ? "female" : "male",
        age: int.parse(_ageController.text.trim()),
        email: _emailController.text.trim(),
        phoneNumber: _phoneNumberController.text.trim(),
        job: _job ?? '',
        password: _passwordController.text.trim(),
      ),
    ).then(
      (value) {
        value.fold(
          (l) {
            emit(ErrorState(failure: l, displayType: DisplayType.popUpDialog));
          },
          (r) {
            emit(SuccessState(AppStrings.registerLayoutSuccessMessage.tr()));
          },
        );
      },
    );
  }

  @override
  int get getIndex => _index;

  @override
  TextEditingController get getFirstNameController => _firstNameController;

  @override
  TextEditingController get getLastNameController => _lastNameController;

  @override
  Gender? get getGender => _gender;

  @override
  TextEditingController get getAgeController => _ageController;

  @override
  TextEditingController get getEmailController => _emailController;

  @override
  TextEditingController get getPhoneNumberController => _phoneNumberController;

  @override
  String? get getJob => _job;

  @override
  TextEditingController get getPasswordController => _passwordController;

  @override
  TextEditingController get getConfirmPasswordController =>
      _confirmPasswordController;

  @override
  void setGender(Gender gender) {
    _gender = gender;
    emit(InitState());
  }

  @override
  void setJob(String job) {
    _job = job;
    emit(InitState());
  }
}

abstract class RegisterLayoutViewModelInput {
  void setGender(Gender gender);

  void setJob(String job);
}

abstract class RegisterLayoutViewModelOutput {
  int get getIndex;

  TextEditingController get getFirstNameController;

  TextEditingController get getLastNameController;

  Gender? get getGender;

  TextEditingController get getAgeController;

  TextEditingController get getEmailController;

  TextEditingController get getPhoneNumberController;

  String? get getJob;

  TextEditingController get getPasswordController;

  TextEditingController get getConfirmPasswordController;
}
