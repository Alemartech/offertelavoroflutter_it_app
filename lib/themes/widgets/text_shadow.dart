import 'package:flutter/material.dart';

class TextShadow extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  const TextShadow(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        shadows: const <Shadow>[
          Shadow(
            offset: Offset(0, 1),
            blurRadius: 5.0,
            color: Color.fromARGB(150, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}
