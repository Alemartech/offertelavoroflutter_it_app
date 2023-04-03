import 'package:auto_route/annotations.dart';
import 'package:offertelavoroflutter_it_app/pages/job_offers_page.dart';
import 'package:offertelavoroflutter_it_app/pages/main_page.dart';
import 'package:offertelavoroflutter_it_app/pages/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page.Route",
  preferRelativeImports: false,
  routes: [
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(page: SplashPage, path: "welcome"),
    AutoRoute(page: JobOffersPage, path: "jobs"),
  ],
)
class $AppRouter {}