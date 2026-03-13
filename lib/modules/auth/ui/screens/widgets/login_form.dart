import 'package:fit_app/modules/auth/ui/screens/widgets/custom_elevated_button.dart';
import 'package:fit_app/modules/auth/ui/screens/widgets/custom_text_field.dart';
import 'package:fit_app/modules/auth/ui/screens/widgets/remember_me_and_forget_password_section.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hintText: 'Email'),
        SizedBox(height: 6),
        CustomTextField(
          hintText: 'Password',
          icon: Icons.visibility_off_outlined,
        ),
        SizedBox(height: 16),
        RememberMeAndForgetPasswordSection(),
        SizedBox(height: 24),
        CustomElevatedButton(text: 'Log In', onPressed: () {}),
      ],
    );
  }
}
