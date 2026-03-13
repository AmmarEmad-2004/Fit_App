import 'package:fit_app/core/utils/service_locator.dart';
import 'package:fit_app/modules/auth/ui/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:fit_app/modules/auth/ui/screens/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<SignInCubit>(),
        child: LoginScreenBody(),
      ),
    );
  }
}
