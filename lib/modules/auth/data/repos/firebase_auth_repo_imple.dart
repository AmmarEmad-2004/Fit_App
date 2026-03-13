import 'package:fit_app/modules/auth/data/models/user_model.dart';
import 'package:fit_app/modules/auth/data/repos/auth_repo.dart';
import 'package:fit_app/modules/auth/data/services/firebase_auth_service.dart';

class FirebaseAuthRepoImple implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  FirebaseAuthRepoImple({required this.firebaseAuthService});
  @override
  Future<UserModel> signIn({required String email, required String password}) async{
    final user = await firebaseAuthService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async{
    final user = await firebaseAuthService.signUpWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    return user;
  }
}
