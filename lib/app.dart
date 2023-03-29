import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_it_app/di/dependency_injector.dart';
import 'package:offertelavoroflutter_it_app/router/app_router.gr.dart';

class OfferteLavoroFlutterApp extends StatelessWidget {
  final _router = AppRouter();
  OfferteLavoroFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dependencyinjector(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) =>
            AppLocalizations.of(context)?.app_name ?? "app_name",
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(),
      ),
    );
  }
}
