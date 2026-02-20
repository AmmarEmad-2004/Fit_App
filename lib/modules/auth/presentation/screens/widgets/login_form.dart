import 'package:fit_app/modules/auth/presentation/screens/widgets/custom_elevated_button.dart';
import 'package:fit_app/modules/auth/presentation/screens/widgets/custom_text_field.dart';
import 'package:fit_app/modules/auth/presentation/screens/widgets/login_types.dart';
import 'package:fit_app/modules/auth/presentation/screens/widgets/remember_me_and_forget_password_section.dart';
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
        CustomElevatedButton(),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Divider(color: Colors.white)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Or login with",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(child: Divider(color: Colors.white)),
          ],
        ),
        SizedBox(height: 24),
        LoginTypes(),
      ],
    );
  }
}


