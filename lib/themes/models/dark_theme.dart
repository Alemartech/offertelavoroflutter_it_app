import 'package:flutter/material.dart';

class DarkTheme {
  static get make => ThemeData(
        fontFamily: "Montserrat",
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(),
      );
}
