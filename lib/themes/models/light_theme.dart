import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class LightTheme {
  static const primaryColor = K.primaryColor;
  static const secondaryColor = K.secondaryColor;
  static const accentColor = K.accentCOlor;

  static get make => ThemeData(
        fontFamily: "Montserrat",
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xff20497a),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(K.primaryColor),
            overlayColor: const MaterialStatePropertyAll(K.secondaryColor),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
            fillColor: const MaterialStatePropertyAll(K.primaryColor),
            checkColor: const MaterialStatePropertyAll(K.accentCOlor),
            side: const BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
      );
}
