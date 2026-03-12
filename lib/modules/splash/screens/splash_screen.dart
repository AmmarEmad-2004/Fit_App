import 'package:fit_app/core/constants/app_images.dart';
import 'package:fit_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Image.asset(AppImages.splash)),
    );
  }
}
