import 'package:dartz/dartz.dart';
import 'package:fit_app/core/errors/auth_failuer.dart';
import 'package:fit_app/modules/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<AuthFailure, UserModel>> signIn({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  });
}
