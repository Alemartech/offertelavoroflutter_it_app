import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/app_localizations_no_context.dart';
import 'package:offertelavoroflutter_it_app/widgets/blog_post_content.dart';
import 'package:offertelavoroflutter_it_app/widgets/header_sliver_appbar.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';
import 'package:offertelavoroflutter_it_app/widgets/search_sliver_bar.dart';

class JobOffersScreen extends StatelessWidget {
  const JobOffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _getTabs().length,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: _buildBodyScreen(context),
        ),
      ),
    );
  }

  Widget _buildBodyScreen(BuildContext context) => Column(
        children: [
          Expanded(
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                HeaderSliverAppbar(
                  title:
                      AppLocalizations.of(context)?.title_job_offers_screen ??
                          "title_job_offers_screen",
                  actions: const [
                    IconItem(
                      icon: LucideIcons.refreshCw,
                    ),
                  ],
                ),
                const SearchSliverBar(),
                const BlogPostContent(),
                SliverAppBar(
                  // tab container
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 10,
                  elevation: 0.0,
                  pinned: true,
                  titleSpacing: 0.0,
                  leadingWidth: 0.0,
                  backgroundColor: Colors.white,
                  bottom: PreferredSize(
                    preferredSize: const Size(100, 0.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32.0),
                      decoration: BoxDecoration(
                        color: K.secondaryColor.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TabBar(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          indicator: BoxDecoration(
                            color: K.primaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: _getTabs(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
              body: Container(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  children: _getTabContents(),
                ),
              ),
            ),
          ),
        ],
      );

  List<Widget> _getTabs() {
    List<String> tabNames = [
      AppLocalizationsNoContext.current.title_tab_jobs,
      AppLocalizationsNoContext.current.title_tab_projects,
    ];

    List<Widget> tabs = [];

    for (final tabName in tabNames) {
      tabs.add(
        Text(
          tabName,
        ),
      );
    }

    return tabs;
  }

  List<Widget> _getTabContents() {
    return [
      _HiringListWidget(),
      _FreelanceListWidget(),
    ];
  }
}

class _HiringListWidget extends StatelessWidget {
  const _HiringListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _FreelanceListWidget extends StatelessWidget {
  const _FreelanceListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
