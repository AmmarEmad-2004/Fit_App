import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/modules/auth/data/models/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromMap(user.user!);
  }

  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromMap(user.user!);
  }
}
