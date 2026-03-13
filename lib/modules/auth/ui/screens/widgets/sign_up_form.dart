import 'package:fit_app/core/routing/app_routers.dart';
import 'package:fit_app/core/utils/auth_validators.dart';
import 'package:fit_app/core/widgets/show_snackbar.dart';
import 'package:fit_app/modules/auth/ui/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:fit_app/modules/auth/ui/screens/widgets/custom_elevated_button.dart';
import 'package:fit_app/modules/auth/ui/screens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _name, _email, _password;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ShowSnackBar.show(
            context,
            'Account created successfully!',
            backgroundColor: Colors.green,
          );
          GoRouter.of(context).push(AppRouters.home);
        } else if (state is SignUpFailure) {
          ShowSnackBar.show(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: _autovalidate,
          child: Column(
            children: [
              CustomTextField(
                key: const Key('sign_up_name'),
                hintText: 'Name',
                validator: AuthValidators.validateName,
                onChanged: (value) => _name = value,
              ),
              const SizedBox(height: 6),
              CustomTextField(
                key: const Key('sign_up_email'),
                hintText: 'Email',
                validator: AuthValidators.validateEmail,
                onChanged: (value) => _email = value,
              ),
              const SizedBox(height: 6),
              CustomTextField(
                key: const Key('sign_up_password'),
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
              const SizedBox(height: 6),
              CustomTextField(
                key: const Key('sign_up_confirm_password'),
                hintText: 'Confirm Password',
                icon: _isConfirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off_outlined,
                obscureText: !_isConfirmPasswordVisible,
                onPressed: () => setState(
                  () => _isConfirmPasswordVisible = !_isConfirmPasswordVisible,
                ),
                validator: (value) =>
                    AuthValidators.validateConfirmPassword(_password, value),
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              state is SignUpLoading
                  ? const CircularProgressIndicator()
                  : CustomElevatedButton(
                      key: const Key('sign_up_button'),
                      text: 'Sign Up',
                      onPressed: () {
                        setState(
                          () => _autovalidate =
                              AutovalidateMode.onUserInteraction,
                        );
                        if (!_formKey.currentState!.validate()) return;
                        context.read<SignUpCubit>().signUp(
                          name: _name!.trim(),
                          email: _email!.trim(),
                          password: _password!.trim(),
                        );
                        setState(
                          () => _autovalidate = AutovalidateMode.disabled,
                        );
                      },
                    ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
