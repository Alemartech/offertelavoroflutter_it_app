import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class IconItem extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  const IconItem({Key? key, required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0.0, 8.0, 16.0, 0.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: K.secondaryColor.withOpacity(0.10),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          icon,
          color: K.primaryColor,
        ),
      ),
    );
  }
}
