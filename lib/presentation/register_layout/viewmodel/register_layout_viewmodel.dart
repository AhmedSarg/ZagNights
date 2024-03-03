import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/domain/models/enums.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';
import 'package:zag_nights/presentation/base/base_states.dart';

import '../states/register_layout_states.dart';

class RegisterLayoutViewModel extends BaseCubit
    implements RegisterLayoutViewModelInput, RegisterLayoutViewModelOutput {

  static RegisterLayoutViewModel get(context) => BlocProvider.of(context);

  int _index = 0;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  Gender? _gender;
  final TextEditingController _ageController = TextEditingController();

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
  void setGender(Gender gender) {
    _gender = gender;
    emit(InitState());
  }

  void validateSecondPage() {
    if (_gender != null) {
      nextPage();
    }
    else {
      emit(InitState());
    }
  }

}

abstract class RegisterLayoutViewModelInput {
  void setGender (Gender gender);
}

abstract class RegisterLayoutViewModelOutput {
  int get getIndex;

  TextEditingController get getFirstNameController;
  TextEditingController get getLastNameController;
  Gender? get getGender;
  TextEditingController get getAgeController;
}
