import 'package:favicon/favicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/app_localizations_no_context.dart';
import 'package:offertelavoroflutter_it_app/widgets/auto_size_text_widget.dart';
import 'package:offertelavoroflutter_it_app/widgets/image_company_widget.dart';
import 'package:offertelavoroflutter_it_app/widgets/no_favicon_company_widget.dart';

class JobInfoMiniCard extends StatelessWidget {
  final JobOfferModel jobHiring;
  final VoidCallback? openContainer;
  const JobInfoMiniCard({Key? key, this.openContainer, required this.jobHiring})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 30.0,
      shadowColor: const Color(0xffe0e0e0),
      child: InkWell(
        onTap: openContainer,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 10.0,
                color: Color(0xffe0e0e0),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  jobHiring.jobDetails.urlWebSiteCompany != null
                      ? FutureBuilder<Favicon?>(
                          future: FaviconFinder.getBest(
                              jobHiring.jobDetails.urlWebSiteCompany!.url!),
                          builder: (context, snapshot) => snapshot.hasData
                              ? ImageCompanyWidget(url: snapshot.data!.url)
                              : const NoFaviconCompanyWidget(),
                        )
                      : const NoFaviconCompanyWidget(),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeTextWidget(
                          jobHiring.jobDetails.nameCompany?.text ??
                              AppLocalizations.of(context)?.text_empty_item ??
                              "text_empty_item",
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        AutoSizeTextWidget(
                          jobHiring.jobDetails.team?.text ??
                              AppLocalizations.of(context)?.text_empty_item ??
                              "text_empty_item",
                          style: const TextStyle(
                            color: K.secondaryColor,
                          ),
                          maxFontSize: 10.0,
                          minFontSize: 8.0,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    LucideIcons.bookmarkMinus,
                    size: 18.0,
                  )
                ],
              ),
              AutoSizeTextWidget(
                jobHiring.jobDetails.jobPosition?.text ??
                    AppLocalizations.of(context)?.text_empty_item ??
                    "text_empty_item",
                style: const TextStyle(fontWeight: FontWeight.w600),
                maxFontSize: 12.0,
              ),
              _localityWidget,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _localityWidget => Row(
        children: [
          const Icon(
            LucideIcons.mapPin,
            size: 12.0,
            color: K.secondaryColor,
          ),
          const SizedBox(
            width: 8.0,
          ),
          AutoSizeTextWidget(
            jobHiring.jobDetails.locality?.text.split(",")[0] ??
                AppLocalizationsNoContext.current.text_empty_item,
            style: const TextStyle(
              color: K.secondaryColor,
            ),
            maxFontSize: 10.0,
            minFontSize: 4.0,
          ),
        ],
      );
}
