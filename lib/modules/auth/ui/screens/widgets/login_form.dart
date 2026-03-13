import 'package:fit_app/core/routing/app_routers.dart';
import 'package:fit_app/core/utils/auth_validators.dart';
import 'package:fit_app/core/widgets/show_snackbar.dart';
import 'package:fit_app/modules/auth/ui/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:fit_app/modules/auth/ui/screens/widgets/custom_elevated_button.dart';
import 'package:fit_app/modules/auth/ui/screens/widgets/custom_text_field.dart';
import 'package:fit_app/modules/auth/ui/screens/widgets/remember_me_and_forget_password_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email, _password;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ShowSnackBar.show(
            context,
            'Successfully Logged In',
            backgroundColor: Colors.green,
          );
          GoRouter.of(context).push(AppRouters.home);
        } else if (state is SignInFailure) {
          ShowSnackBar.show(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Email',
                validator: AuthValidators.validateEmail,
                onChanged: (value) => _email = value,
              ),
              const SizedBox(height: 6),
              CustomTextField(
                hintText: 'Password',
                icon: _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off_outlined,
                obscureText: !_isPasswordVisible,
                onPressed: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
                validator: AuthValidators.validatePassword,
                onChanged: (value) => _password = value,
              ),
              const SizedBox(height: 16),
              const RememberMeAndForgetPasswordSection(),
              const SizedBox(height: 24),
              state is SignInLoading
                  ? const CircularProgressIndicator()
                  : CustomElevatedButton(
                      text: 'Log In',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        context.read<SignInCubit>().signIn(
                          email: _email!.trim(),
                          password: _password!.trim(),
                        );
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
