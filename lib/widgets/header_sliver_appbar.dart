import 'package:flutter/material.dart';

class HeaderSliverAppbar extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  const HeaderSliverAppbar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      expandedHeight: 0.0,
      automaticallyImplyLeading: false,
      leadingWidth: 80,
      leading: leading,
      title: Text(
        title ?? "",
      ),
      actions: actions,
    );
  }
}
