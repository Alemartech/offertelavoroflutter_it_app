import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/cubits/bookmark_save_cubit.dart';
import 'package:offertelavoroflutter_it_app/cubits/bookmarks_retrieve/bookmarks_retrieve_cubit.dart';
import 'package:offertelavoroflutter_it_app/models/bookmark_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/pages/screens/job_freelance_details_screen.dart';
import 'package:offertelavoroflutter_it_app/pages/screens/job_offer_details_screen.dart';
import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/auto_size_text_widget.dart';
import 'package:offertelavoroflutter_it_app/widgets/no_favicon_company_widget.dart';
import 'package:offertelavoroflutter_it_app/widgets/open_container_wrapper.dart';

class SavedJobOffersScreen extends StatelessWidget {
  final List<JobOfferModel>? jobsHiring;
  final List<JobProjectModel>? jobsFreelance;
  const SavedJobOffersScreen({Key? key, this.jobsFreelance, this.jobsHiring})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarkRetrieveCubit>(
      create: (context) => BookmarkRetrieveCubit(
        jobRepository: context.read<JobRepository>(),
      )..retrieveBookmarks(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Salvati"),
        ),
        body: _buildBodySavedJob,
      ),
    );
  }

  Widget get _buildBodySavedJob =>
      BlocBuilder<BookmarkRetrieveCubit, BookmarkRetrieveState>(
        builder: (context, state) {
          List<BookmarkModel> bookmarks = [];
          if (state is FetchedBookmarkState) {
            bookmarks = state.bookmarks;
            return _fetchedBookmarks(bookmarks);
          } else if (state is NoBookmarkRetrievedState) {
            return _noFetchedBookmarks;
          }

          return _loadingBookmarks;
        },
      );

  Widget get _loadingBookmarks => Container();

  Widget get _noFetchedBookmarks => Container();

  Widget _fetchedBookmarks(List<BookmarkModel> bookmarks) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final jobH = jobsHiring?.map((job) {
            if (job.id == bookmarks[index].id) {
              return job;
            }
          }).firstWhere(
            (element) => element != null,
            orElse: () => null,
          );

          final jobF = jobsFreelance?.map((job) {
            if (job.id == bookmarks[index].id) {
              return job;
            }
          }).firstWhere(
            (element) => element != null,
            orElse: () => null,
          );

          if (jobH != null || jobF != null) {
            return OpenContainerWrapper(
              closedBuilder: (context, openContainer) => _MatchedBookmarkJob(
                job: jobH ?? jobF,
                openContainer: openContainer,
              ),
              transitionType: ContainerTransitionType.fadeThrough,
              child: jobH != null
                  ? JobOfferDetailsScreen(jobHiring: jobH)
                  : JobFreelanceDetailsScreen(jobFreelance: jobF!),
            );
          } else {
            return const _NoMatchedBookmarkJob();
          }
        },
        itemCount: bookmarks.length,
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          color: K.secondaryColor.withOpacity(0.10),
        ),
      );
}

class _MatchedBookmarkJob<T> extends StatelessWidget {
  final T job;
  final VoidCallback? openContainer;
  const _MatchedBookmarkJob({
    Key? key,
    required this.job,
    this.openContainer,
  }) : super(key: key);

  ActionPane _actionPanelDismissible(BuildContext context) => ActionPane(
        motion: const DrawerMotion(),
        dismissible: DismissiblePane(
            onDismissed: () => context.read<BookmarkSaveCubit>().deleteBookmark(
                (job is JobOfferModel)
                    ? (job as JobOfferModel).id
                    : (job as JobProjectModel).id)),
        children: [
          _customSlidable(),
        ],
      );

  Widget _customSlidable() => CustomSlidableAction(
        onPressed: (_) {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            "Scorri per eliminare.",
            style: const TextStyle(
              color: K.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    bool isHiring = (job is JobOfferModel);
    bool isFreelance = (job is JobProjectModel);

    return Slidable(
      key: UniqueKey(),
      startActionPane: _actionPanelDismissible(context),
      endActionPane: _actionPanelDismissible(context),
      child: InkWell(
        onTap: openContainer,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: K.secondaryColor.withOpacity(0.10),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          isHiring
                              ? AppLocalizations.of(context)?.title_tab_jobs ??
                                  ""
                              : AppLocalizations.of(context)
                                      ?.title_tab_projects ??
                                  "",
                          style: const TextStyle(
                            color: K.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    isFreelance
                        ? const FlutterLogo(
                            size: 50,
                          )
                        : const NoFaviconCompanyWidget(
                            width: 50,
                            height: 50,
                          ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isHiring
                              ? (job as JobOfferModel)
                                      .jobDetails
                                      .jobQualification
                                      ?.text ??
                                  (job as JobOfferModel)
                                      .jobDetails
                                      .jobPosition!
                                      .text
                                      .split("|")[0]
                              : (job as JobProjectModel)
                                  .projectDetails
                                  .jobTitle!
                                  .text,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          isHiring
                              ? (job as JobOfferModel)
                                  .jobDetails
                                  .nameCompany!
                                  .text
                              : (job as JobProjectModel)
                                  .projectDetails
                                  .employRelationship!
                                  .text,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: K.secondaryColor),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        AutoSizeTextWidget(
                          isHiring
                              ? (job as JobOfferModel)
                                  .jobDetails
                                  .jobDescription
                                  .descriptionItems[0]
                                  .text
                              : (job as JobProjectModel)
                                      .projectDetails
                                      .jobDescription
                                      ?.descriptionItems[0]
                                      .text ??
                                  AppLocalizations.of(context)
                                      ?.text_empty_item ??
                                  "text_empty_item",
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Pubblicato il: //${DateFormat(DateFormat.YEAR_MONTH_DAY, AppLocalizations.of(context)?.localeName).format(isHiring ? (job as JobOfferModel).jobDetails.jobCreatedTime!.created : (job as JobProjectModel).projectDetails.jobCreatedTime.created)}",
                      style: const TextStyle(
                          fontSize: 10.0, color: K.secondaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoMatchedBookmarkJob extends StatelessWidget {
  const _NoMatchedBookmarkJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Annuncio rimosso o non più disponibile.",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rimuovi",
                        style: TextStyle(color: Colors.red),
                      ),
                      Icon(
                        LucideIcons.trash2,
                        color: Colors.red,
                      )
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
