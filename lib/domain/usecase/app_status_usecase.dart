import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class AppStatusUseCase extends BaseUseCase<void, bool> {
  final Repository _repository;

  AppStatusUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(void input) async {
    return _repository.getAppStatus();
  }
}