import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: const Color(0xffffc300),
    secondary: const Color.fromARGB(255, 245, 247, 170),
    background: Colors.grey.shade300,
    error: const Color(0xFFEE6352),
    inversePrimary: const Color.fromARGB(255, 255, 214, 143),
    inverseSurface: Colors.grey[800],
  ),
);
