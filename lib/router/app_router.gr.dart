// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart'
    as _i7;
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart'
    as _i6;
import 'package:offertelavoroflutter_it_app/pages/job_wrapper_page.dart' as _i3;
import 'package:offertelavoroflutter_it_app/pages/main_page.dart' as _i1;
import 'package:offertelavoroflutter_it_app/pages/splash_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    SplashPageRoute.name: (routeData) {
      final args = routeData.argsAs<SplashPageRouteArgs>(
          orElse: () => const SplashPageRouteArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.SplashPage(
          key: args.key,
          jobFreelance: args.jobFreelance,
          jobHiring: args.jobHiring,
        ),
      );
    },
    JobWrapperPageRoute.name: (routeData) {
      final args = routeData.argsAs<JobWrapperPageRouteArgs>(
          orElse: () => const JobWrapperPageRouteArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.JobWrapperPage(
          key: args.key,
          jobFreelance: args.jobFreelance,
          jobHiring: args.jobHiring,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          MainPageRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          SplashPageRoute.name,
          path: 'welcome',
        ),
        _i4.RouteConfig(
          JobWrapperPageRoute.name,
          path: 'jobs',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainPageRoute extends _i4.PageRouteInfo<void> {
  const MainPageRoute()
      : super(
          MainPageRoute.name,
          path: '/',
        );

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [_i2.SplashPage]
class SplashPageRoute extends _i4.PageRouteInfo<SplashPageRouteArgs> {
  SplashPageRoute({
    _i5.Key? key,
    List<_i6.JobProjectModel>? jobFreelance,
    List<_i7.JobOfferModel>? jobHiring,
  }) : super(
          SplashPageRoute.name,
          path: 'welcome',
          args: SplashPageRouteArgs(
            key: key,
            jobFreelance: jobFreelance,
            jobHiring: jobHiring,
          ),
        );

  static const String name = 'SplashPageRoute';
}

class SplashPageRouteArgs {
  const SplashPageRouteArgs({
    this.key,
    this.jobFreelance,
    this.jobHiring,
  });

  final _i5.Key? key;

  final List<_i6.JobProjectModel>? jobFreelance;

  final List<_i7.JobOfferModel>? jobHiring;

  @override
  String toString() {
    return 'SplashPageRouteArgs{key: $key, jobFreelance: $jobFreelance, jobHiring: $jobHiring}';
  }
}

/// generated route for
/// [_i3.JobWrapperPage]
class JobWrapperPageRoute extends _i4.PageRouteInfo<JobWrapperPageRouteArgs> {
  JobWrapperPageRoute({
    _i5.Key? key,
    List<_i6.JobProjectModel>? jobFreelance,
    List<_i7.JobOfferModel>? jobHiring,
  }) : super(
          JobWrapperPageRoute.name,
          path: 'jobs',
          args: JobWrapperPageRouteArgs(
            key: key,
            jobFreelance: jobFreelance,
            jobHiring: jobHiring,
          ),
        );

  static const String name = 'JobWrapperPageRoute';
}

class JobWrapperPageRouteArgs {
  const JobWrapperPageRouteArgs({
    this.key,
    this.jobFreelance,
    this.jobHiring,
  });

  final _i5.Key? key;

  final List<_i6.JobProjectModel>? jobFreelance;

  final List<_i7.JobOfferModel>? jobHiring;

  @override
  String toString() {
    return 'JobWrapperPageRouteArgs{key: $key, jobFreelance: $jobFreelance, jobHiring: $jobHiring}';
  }
}
