import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class IconItem extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final double paddingHorizontal;
  final double paddingVertical;
  final bool isTapped;
  const IconItem({
    Key? key,
    required this.icon,
    this.onTap,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 0.0,
    this.isTapped = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal, vertical: paddingVertical),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color:
                isTapped ? K.primaryColor : K.secondaryColor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            icon,
            color: isTapped ? K.accentCOlor : K.primaryColor,
          ),
        ),
      ),
    );
  }
}
