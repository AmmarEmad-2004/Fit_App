import 'package:flutter/material.dart';

class ShowSnackBar {
  static void show(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.red,
  }) {
    ScaffoldMessenger.of(
      context,
    ).hideCurrentSnackBar(); // إخفاء أي SnackBar سابقة
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white), // تخصيص النص
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}