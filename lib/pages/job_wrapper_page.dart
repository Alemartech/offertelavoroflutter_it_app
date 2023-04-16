import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/models/job_model.dart';

import 'package:offertelavoroflutter_it_app/pages/screens/job_offers_screen.dart';
import 'package:offertelavoroflutter_it_app/pages/screens/saved_job_offers_screen.dart';
import 'package:offertelavoroflutter_it_app/pages/screens/training_flutter_screen.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/app_localizations_no_context.dart';

class JobWrapperPage extends StatefulWidget {
  final List<JobModel>? jobHiring;
  final List<JobModel>? jobFreelance;
  const JobWrapperPage({Key? key, this.jobFreelance, this.jobHiring})
      : super(key: key);

  @override
  State<JobWrapperPage> createState() => _JobWrapperPageState();
}

class _JobWrapperPageState extends State<JobWrapperPage> {
  int _currentNavBarIndex = 0;

  final _bottomNavigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.home),
      label: AppLocalizationsNoContext.current.bottom_nav_label_home,
    ),
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.bookmarkMinus),
      label: AppLocalizationsNoContext.current.bottom_nav_label_saved,
    ),
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.graduationCap),
      label: AppLocalizationsNoContext.current.bottom_nav_label_training,
    ),
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.sliders),
      label: AppLocalizationsNoContext.current.bottom_nav_label_settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) =>
                FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            child: _NavigationDestinationScreen(
              key: UniqueKey(),
              currentIndex: _currentNavBarIndex,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 12.0,
            items: _bottomNavigationBarItems,
            currentIndex: _currentNavBarIndex,
            onTap: (index) {
              setState(() {
                _currentNavBarIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

class _NavigationDestinationScreen extends StatelessWidget {
  final JobModel? jobHiring;
  final JobModel? jobFreelance;
  final int currentIndex;
  const _NavigationDestinationScreen(
      {Key? key, required this.currentIndex, this.jobHiring, this.jobFreelance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return JobOffersScreen(
          jobFreelance: jobFreelance,
          jobHiring: jobHiring,
        );

      case 1:
        return const SavedJobOffersScreen();

      case 2:
        return const TrainingFlutterScreen();

      default:
    }

    return Center(
      child: Text("Ciao $currentIndex"),
    );
  }
}
