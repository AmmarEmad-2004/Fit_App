import 'dart:ui';

import 'package:fit_app/modules/auth/presentation/screens/widgets/login_section.dart';
import 'package:flutter/material.dart';

class CustomloginCard extends StatelessWidget {
  const CustomloginCard({super.key});

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
            child: LoginSection(),
          ),
        ),
      ),
    );
  }
}
