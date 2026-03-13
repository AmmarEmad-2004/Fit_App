import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_cubit_state.dart';

class SignInCubitCubit extends Cubit<SignInCubitState> {
  SignInCubitCubit() : super(SignInCubitInitial());
}
