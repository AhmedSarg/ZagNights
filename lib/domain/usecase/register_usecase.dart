import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class RegisterUseCase extends BaseUseCase<RegisterUseCaseInput, void> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(RegisterUseCaseInput input) async {
    return _repository.register(
      firstName: input.firstName,
      lastName: input.lastName,
      gender: input.gender,
      age: input.age,
      email: input.email,
      phoneNumber: input.phoneNumber,
      job: input.job,
      password: input.password,
    );
  }
}

class RegisterUseCaseInput {
  final String firstName;
  final String lastName;
  final String gender;
  final int age;
  final String email;
  final String phoneNumber;
  final String job;
  final String password;

  RegisterUseCaseInput({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.email,
    required this.phoneNumber,
    required this.job,
    required this.password,
  });
}
