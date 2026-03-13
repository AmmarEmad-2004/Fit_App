import 'package:fit_app/core/utils/service_locator.dart';
import 'package:fit_app/modules/auth/ui/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:fit_app/modules/auth/ui/screens/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
      child: Scaffold(body: SignUpScreenBody()),
    );
  }
}
