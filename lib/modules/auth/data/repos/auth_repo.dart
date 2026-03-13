import 'package:fit_app/modules/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> signIn({required String email, required String password});
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });
}
