import 'package:fit_app/modules/auth/data/models/user_model.dart';
import 'package:fit_app/modules/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());

  final AuthRepo authRepo;

  Future <void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepo.signIn(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignInFailure(errorMessage: failure.errorMessage)),
      (user) => emit(SignInSuccess(user: user)),
    );
  }
}
