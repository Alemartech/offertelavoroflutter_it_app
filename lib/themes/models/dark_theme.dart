import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class DarkTheme {
  static get make => ThemeData(
        fontFamily: "Montserrat",
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(),
        checkboxTheme: CheckboxThemeData(
          fillColor: const MaterialStatePropertyAll(K.primaryColor),
          checkColor: const MaterialStatePropertyAll(K.accentColor),
          side: const BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      );
}
