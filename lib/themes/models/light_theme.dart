import 'package:flutter/material.dart';

class LightTheme {
  static get make => ThemeData(
      fontFamily: "Montserrat",
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Color(0xff20497a),
        ),
      ));
}
