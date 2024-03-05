import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/enums.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';

class RegisterLayoutViewModel extends BaseCubit
    implements RegisterLayoutViewModelInput, RegisterLayoutViewModelOutput {

  static RegisterLayoutViewModel get(context) => BlocProvider.of(context);

  int _index = 0;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  Gender? _gender;
  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? _job;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void start() {}

  void nextPage() {
    emit(InitState());
    _index++;
  }

  void prevPage() {
    emit(InitState());
    _index--;
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
  TextEditingController get getConfirmPasswordController => _confirmPasswordController;

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
  void setGender (Gender gender);
  void setJob (String job);
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
