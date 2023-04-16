import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';

class SearchSliverBar extends StatelessWidget {
  const SearchSliverBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      title: _SearchBar(),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  bool isFocused = false;
  bool isTappedFilterButton = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: TextField(
            onTap: () => setState(() {
              isFocused = !isFocused;
            }),
            onSubmitted: (value) => setState(() {
              isFocused = !isFocused;
            }),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: K.secondaryColor.withOpacity(0.10), width: 2.0),
                borderRadius: BorderRadius.circular(50.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                LucideIcons.search,
                color: isFocused
                    ? K.primaryColor
                    : K.secondaryColor.withOpacity(0.10),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        _filterSearch(),
      ],
    );
  }

  Widget _filterSearch() => IconItem(
        isTapped: isTappedFilterButton,
        icon: LucideIcons.settings2,
        onTap: () => setState(() {
          isTappedFilterButton = !isTappedFilterButton;
        }),
      );
}
