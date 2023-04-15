import 'package:flutter/material.dart';

class SearchSliverBar extends StatelessWidget {
  const SearchSliverBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      // riderca
      pinned: true,
      automaticallyImplyLeading: false,
    );
  }
}
