import 'package:flutter/material.dart';

abstract class AppColors {
  static const materialAccent = const MaterialColor(
    0xFFFF9C00,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );
  // theme based colors
  static const accent = Color(0xFFFF9C00);
  static const text = Colors.black;
  static const textSecondary = Colors.grey;

  // fixed colors
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const grey20 = Color(0xFFEEEEEE);
  static const lightGrey = Color(0xFFBDBDBD);
  static const red = Colors.redAccent;
  static const green = Colors.green;
}
