import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/models/app/filter_tag_model.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';

class SearchSliverBar extends StatefulWidget {
  const SearchSliverBar({Key? key}) : super(key: key);

  @override
  State<SearchSliverBar> createState() => _SearchSliverBarState();
}

class _SearchSliverBarState extends State<SearchSliverBar>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _heightAppBarController;

  late Animation<double> _animationFiltersContainer;
  late AnimationController _heightFiltersContainerController;

  final TextEditingController _serachBarController = TextEditingController();
  final TextEditingController _serachLocController = TextEditingController();

  List<Widget> _itemFilters = [];

  bool isFocused = false;
  bool isTappedFilterButton = false;

  @override
  void initState() {
    _heightAppBarController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    _animation =
        Tween<double>(begin: 90, end: 350).animate(_heightAppBarController)
          ..addListener(() {
            setState(() {});
          });

    _heightFiltersContainerController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    _animationFiltersContainer =
        Tween<double>(begin: 0, end: 250).animate(_heightAppBarController)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  void _expandSearchBar() {
    if (isTappedFilterButton) {
      _heightAppBarController.forward();
      _heightFiltersContainerController.forward();
    } else {
      _heightAppBarController.reverse();
      _heightFiltersContainerController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      toolbarHeight: _animation.value,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _searchBar(),
          _expandedSearchBar(),
        ],
      ),
    );
  }

  Widget _searchBar() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TextField(
              controller: _serachBarController,
              onTap: () => setState(() {
                isFocused = !isFocused;
              }),
              onSubmitted: (value) => setState(() {
                isFocused = !isFocused;
              }),
              decoration: InputDecoration(
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
          _filterSearchButton(),
        ],
      );

  Widget _filterSearchButton() => IconItem(
        isTapped: isTappedFilterButton,
        icon: LucideIcons.settings2,
        onTap: () {
          setState(() {
            isTappedFilterButton = !isTappedFilterButton;
          });
          _expandSearchBar();
        },
      );

  Widget _expandedSearchBar() => Container(
        margin: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        height: _animationFiltersContainer.value,
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  ),
                  child: Text(
                    AppLocalizations.of(context)?.action_reset_filters ??
                        "action_reset_filters",
                    style: const TextStyle(
                      color: K.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            ExpandablePanel(
              header: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppLocalizations.of(context)?.label_more_filters ??
                      "label_more_filters",
                  style: const TextStyle(
                    fontSize: 14,
                    color: K.secondaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              collapsed: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleSectionFilterPanel(AppLocalizations.of(context)
                          ?.title_filter_section_experience ??
                      "title_filter_section_experience"),
                  _buildSeniorityFilters(),
                  const SizedBox(
                    height: 4.0,
                  ),
                  _titleSectionFilterPanel(
                      AppLocalizations.of(context)?.title_filter_section_team ??
                          "title_filter_section_team"),
                  _buildTeamFilters(),
                  const SizedBox(
                    height: 4.0,
                  ),
                ],
              ),
              expanded: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleSectionFilterPanel(AppLocalizations.of(context)
                          ?.title_filter_section_agreement ??
                      "title_filter_section_agreement"),
                  _buildAgreementFilters(),
                  const SizedBox(
                    height: 4.0,
                  ),
                  _titleSectionFilterPanel(AppLocalizations.of(context)
                          ?.title_filter_section_locality ??
                      "title_filter_section_locality"),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextField(
                      controller: _serachLocController,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget _titleSectionFilterPanel(String title) => Text(
        title,
        style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
      );

  Widget _buildSeniorityFilters() => Row(
        children: [
          for (final seniorityFilter in seniorityfilters)
            _FilterTagWidget(
              filterTag: seniorityFilter,
              onSelected: (value) => setState(() {
                seniorityFilter.isSelected = !seniorityFilter.isSelected;
              }),
            ),
        ],
      );

  Widget _buildTeamFilters() => Row(
        children: [
          for (final teamFiler in teamFilters)
            _FilterTagWidget(
              filterTag: teamFiler,
              onSelected: (p0) => setState(() {
                teamFiler.isSelected = !teamFiler.isSelected;
              }),
            ),
        ],
      );

  Widget _buildAgreementFilters() => Row(
        children: [
          for (final agreementFilter in agreementFilters)
            _FilterTagWidget(
              filterTag: agreementFilter,
              onSelected: (p0) => setState(() {
                agreementFilter.isSelected = !agreementFilter.isSelected;
              }),
            ),
        ],
      );
}

class _FilterTagWidget extends StatelessWidget {
  final FilterTagModel filterTag;
  final void Function(bool)? onSelected;
  const _FilterTagWidget({Key? key, required this.filterTag, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          FilterChip(
            checkmarkColor: K.accentColor,
            pressElevation: 0.0,
            backgroundColor: K.secondaryColor.withOpacity(0.18),
            selectedColor: K.primaryColor,
            label: Text(filterTag.label),
            labelStyle: TextStyle(
              color: filterTag.isSelected ? K.accentColor : K.secondaryColor,
              fontSize: 12.0,
            ),
            selected: filterTag.isSelected,
            onSelected: onSelected,
            showCheckmark: filterTag.isSelected,
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
      );
}
