import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, bool>> getAppStatus();

  Future<Either<Failure, void>> register({
    required String firstName,
    required String lastName,
    required String gender,
    required int age,
    required String email,
    required String phoneNumber,
    required String job,
    required String password,
  });

  Future<Either<Failure, User?>> getSignedUser();

  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> logout();

}
