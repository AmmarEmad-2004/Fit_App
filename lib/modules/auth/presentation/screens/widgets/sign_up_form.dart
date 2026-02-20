import 'package:fit_app/modules/auth/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:fit_app/modules/auth/presentation/screens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hintText: 'Name'),
        SizedBox(height: 6),
        CustomTextField(hintText: 'Email'),
        SizedBox(height: 6),
        CustomTextField(
          hintText: 'Password',
          icon: Icons.visibility_off_outlined,
        ),
        SizedBox(height: 6),
        CustomTextField(
          hintText: 'Confirm Password',
          icon: Icons.visibility_off_outlined,
        ),
        SizedBox(height: 24),
        CustomElevatedButton(),
        SizedBox(height: 24),
      ],
    );
  }
}
