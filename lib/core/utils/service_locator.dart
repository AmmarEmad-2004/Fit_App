import 'package:fit_app/modules/auth/data/repos/auth_repo.dart';
import 'package:fit_app/modules/auth/data/repos/firebase_auth_repo_imple.dart';
import 'package:fit_app/modules/auth/data/services/firebase_auth_service.dart';
import 'package:fit_app/modules/auth/ui/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:fit_app/modules/auth/ui/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void setUPGetIt() {
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<AuthRepo>(() =>
      FirebaseAuthRepoImple(firebaseAuthService: getIt<FirebaseAuthService>()));

  getIt.registerFactory<SignInCubit>(
      () => SignInCubit(authRepo: getIt<AuthRepo>()));
  getIt.registerFactory<SignUpCubit>(
      () => SignUpCubit(authRepo: getIt<AuthRepo>()));
}
