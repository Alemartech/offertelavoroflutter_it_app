import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/widgets/header_sliver_appbar.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';

class JobOfferDetailsScreen extends StatelessWidget {
  const JobOfferDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: _buildJobDetails(context),
      ),
    );
  }

  Widget _buildJobDetails(BuildContext context) => CustomScrollView(
        slivers: [
          HeaderSliverAppbar(
            leading: IconItem(
              onTap: () => context.router.pop(),
              icon: LucideIcons.x,
              paddingHorizontal: 16.0,
            ),
            title: AppLocalizations.of(context)?.title_job_details ??
                "title_job_details",
            actions: const [
              IconItem(
                icon: LucideIcons.bookmarkMinus,
                paddingHorizontal: 16.0,
              ),
            ],
          ),
        ],
      );
}
