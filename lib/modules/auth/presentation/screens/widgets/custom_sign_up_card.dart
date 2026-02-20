import 'dart:ui';

import 'package:fit_app/modules/auth/presentation/screens/widgets/sign_up_section.dart';
import 'package:flutter/material.dart';

class CustomSignUpCard extends StatelessWidget {
  const CustomSignUpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Card(
          margin: EdgeInsets.zero,
          color: Color(0xffEFF0F6).withValues(alpha: 0.7 * 255),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SignUpSection(),
          ),
        ),
      ),
    );
  }
}


