import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade200,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade100,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade700,
    ),
  );

  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      surface: const Color.fromARGB(255, 20, 20, 20),
      primary: const Color.fromARGB(255, 122, 122, 122),
      secondary: const Color.fromARGB(255, 30, 30, 30),
      tertiary: const Color.fromARGB(255, 47, 47, 47),
      inversePrimary: Colors.grey.shade300,
    ),
  );
}
