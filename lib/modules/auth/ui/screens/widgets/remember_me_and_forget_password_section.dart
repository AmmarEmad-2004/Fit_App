import 'package:flutter/material.dart';

class RememberMeAndForgetPasswordSection extends StatelessWidget {
  const RememberMeAndForgetPasswordSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.check_box_outline_blank_rounded,
            color: Color(0xff6c7278),
          ),
        ),
        Text(
          'Remember me',
          style: TextStyle(
            color: Color(0xff6c7278),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Text(
          'Forgot password?',
          style: TextStyle(
            color: Color(0xff4d81e7),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}