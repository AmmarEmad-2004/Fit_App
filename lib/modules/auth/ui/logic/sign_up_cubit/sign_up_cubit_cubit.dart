import 'package:fit_app/modules/auth/data/models/user_model.dart';
import 'package:fit_app/modules/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_cubit_state.dart';

class SignUpCubitCubit extends Cubit<SignUpCubitState> {
  SignUpCubitCubit({required this.authRepo}) : super(SignUpCubitInitial());

  final AuthRepo authRepo;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.signUp(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignUpFailure(errorMessage: failure.errorMessage)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }
}
