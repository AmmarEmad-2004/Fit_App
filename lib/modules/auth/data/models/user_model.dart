import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final String? photoUrl;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.photoUrl,
  });

  factory UserModel.fromMap(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email!,
      name: user.displayName!,
      photoUrl: user.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'name': name, 'photoUrl': photoUrl};
  }
}
