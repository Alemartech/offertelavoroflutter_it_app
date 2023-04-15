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
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashPage(),
      );
    },
    JobWrapperPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.JobWrapperPage(),
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
class SplashPageRoute extends _i4.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'welcome',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i3.JobWrapperPage]
class JobWrapperPageRoute extends _i4.PageRouteInfo<void> {
  const JobWrapperPageRoute()
      : super(
          JobWrapperPageRoute.name,
          path: 'jobs',
        );

  static const String name = 'JobWrapperPageRoute';
}
