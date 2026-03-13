import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/core/errors/auth_failuer.dart';
import 'package:fit_app/modules/auth/data/models/user_model.dart';
import 'package:fit_app/modules/auth/data/repos/auth_repo.dart';
import 'package:fit_app/modules/auth/data/services/firebase_auth_service.dart';

class FirebaseAuthRepoImple implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  FirebaseAuthRepoImple({required this.firebaseAuthService});

  @override
  Future<Either<AuthFailure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(errorMessage: e.message ?? 'Sign in failed'));
    } catch (e) {
      return left(AuthFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(errorMessage: e.message ?? 'Sign up failed'));
    } catch (e) {
      return left(AuthFailure(errorMessage: e.toString()));
    }
  }
}

