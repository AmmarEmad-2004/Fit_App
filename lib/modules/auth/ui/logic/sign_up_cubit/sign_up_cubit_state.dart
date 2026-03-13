part of 'sign_up_cubit_cubit.dart';

@immutable
sealed class SignUpCubitState {}

final class SignUpCubitInitial extends SignUpCubitState {}
final class SignUpLoading extends SignUpCubitState {}
final class SignUpSuccess extends SignUpCubitState {
  final UserModel user;
  SignUpSuccess({required this.user});
}
final class SignUpFailure extends SignUpCubitState {
  final String errorMessage;
  SignUpFailure({required this.errorMessage});
}
