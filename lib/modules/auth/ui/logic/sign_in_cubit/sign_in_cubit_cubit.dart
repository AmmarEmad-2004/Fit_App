

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_cubit_state.dart';

class SignInCubitCubit extends Cubit<SignInCubitState> {
  SignInCubitCubit() : super(SignInCubitInitial());
}
