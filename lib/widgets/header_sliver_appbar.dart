import 'package:flutter/material.dart';

class HeaderSliverAppbar extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  const HeaderSliverAppbar({Key? key, this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      automaticallyImplyLeading: false,
      title: Text(
        title ?? "",
      ),
      actions: actions,
    );
  }
}
