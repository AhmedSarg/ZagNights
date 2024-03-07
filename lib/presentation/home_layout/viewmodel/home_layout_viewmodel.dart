import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/domain/usecase/log_out_usecase.dart';

import '../../../domain/usecase/app_status_usecase.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';
import '../states/home_states.dart';

class HomeLayoutViewModel extends BaseCubit
    implements HomeLayoutViewModelInput, HomeLayoutViewModelOutput {
  final AppStatusUseCase _appStatusUseCase;
  final LogOutUseCase _logOutUseCase;

  static HomeLayoutViewModel get(context) => BlocProvider.of(context);

  HomeLayoutViewModel(this._appStatusUseCase, this._logOutUseCase);

  late bool _appStatus;

  @override
  void start() {
    _loadData();
  }

  void logout() {
    _logOutUseCase(null).then((value) {
      value.fold(
        (l) {
          emit(ErrorState(failure: l));
        },
        (r) {
          emit(LogOutState());
        },
      );
    });
  }

  void _loadData() {
    emit(LoadingState());
    _appStatusUseCase(null).then(
      (value) {
        value.fold(
          (l) {
            emit(ErrorState(
              failure: l,
              retry: () {
                start();
              },
            ));
          },
          (r) {
            _appStatus = r;
            if (_appStatus) {
              emit(ContentState());
            } else {
              emit(SoonState());
            }
          },
        );
      },
    );
  }

  @override
  bool get getAppStatus => _appStatus;
}

abstract class HomeLayoutViewModelInput {}

abstract class HomeLayoutViewModelOutput {
  bool get getAppStatus;
}
