import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField( {
    super.key,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.onPressed,
    required this.onChanged, this.validator,
  });
  final String hintText;
  final IconData? icon;
  final bool? obscureText;
  final VoidCallback? onPressed;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: icon != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(icon, color: Color(0xffacb5bb)),
              )
            : null,
        hintStyle: TextStyle(color: Color(0xff6c7278)),
        fillColor: Colors.white,
        filled: true,
        border: border(),
        focusedBorder: border(),
        enabledBorder: border(),
        errorBorder: errorBorder(),
        focusedErrorBorder: errorBorder(),
        errorStyle: const TextStyle(
          color: Color(0xffE53935),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xffE53935), width: 1.5),
    );
  }
}
