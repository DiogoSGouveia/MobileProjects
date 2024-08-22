import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: const Color(0xffffe000),
    //primary: const Color(0xFFFAC05E),
    secondary: const Color(0xFF2A2D3E),
    background: Colors.grey[900]!,
    error: const Color(0xFFEE6352),
    inversePrimary: const Color.fromARGB(255, 255, 214, 143),
    inverseSurface: Colors.grey[200],
  ),
);
