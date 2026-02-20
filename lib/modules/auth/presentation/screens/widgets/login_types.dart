import 'package:fit_app/core/constants/app_images.dart';
import 'package:fit_app/modules/auth/presentation/screens/widgets/custom_background.dart';
import 'package:flutter/material.dart';

class LoginTypes extends StatelessWidget {
  const LoginTypes({super.key});
  static List<String> loginTypes = [
    AppImages.imagesGoogle,
    AppImages.imagesFacebook,
    AppImages.imagesApple,
    AppImages.imagesDeviceMobile,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          loginTypes.map((image) {
            return CustomBackground(image: image);
          }).toList(),
    );
  }
}