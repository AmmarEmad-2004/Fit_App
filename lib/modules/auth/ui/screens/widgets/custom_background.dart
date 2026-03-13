import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 62.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
       image,
        height: 18,
        width: 18,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}