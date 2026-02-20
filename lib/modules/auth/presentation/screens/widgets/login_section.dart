import 'package:fit_app/core/routing/app_routers.dart';
import 'package:fit_app/modules/auth/presentation/screens/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 36),
          ),
          SizedBox(height: 12),
          Text(
            'Enter your email and password to log in ',
            style: TextStyle(
              color: Color(0xff6c7278),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24),
          LoginForm(),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                'Don’t have an account?',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff537b9f),
                ),
              ),
              SizedBox(height: 6),
              InkWell(
                onTap: () {
                  context.push(AppRouters.signUp);
                },
                child: Text(
                  ' Sign Up',
                  style: TextStyle(
                    color: Color(0xff4d81e7),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
