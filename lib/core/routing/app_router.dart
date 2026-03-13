import 'package:fit_app/core/routing/app_routers.dart';
import 'package:fit_app/modules/auth/ui/screens/login_screen.dart';
import 'package:fit_app/modules/auth/ui/screens/sign_up_screen.dart';
import 'package:fit_app/modules/home/ui/screens/home_screen.dart';
import 'package:fit_app/modules/splash/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: AppRouters.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRouters.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouters.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRouters.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
