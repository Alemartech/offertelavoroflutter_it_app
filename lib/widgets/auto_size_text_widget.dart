import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextWidget extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final TextStyle? style;
  const AutoSizeTextWidget(
    this.text, {
    Key? key,
    this.minFontSize = 10.0,
    this.maxFontSize = 12.0,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      maxLines: 2,
      style: style,
      overflow: TextOverflow.ellipsis,
    );
  }
}
