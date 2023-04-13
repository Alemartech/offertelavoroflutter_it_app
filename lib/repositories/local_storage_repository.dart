import 'dart:async';

import 'package:offertelavoroflutter_it_app/services/local/local_storage_preferences_service.dart';

class LocalStoragePrefRepository {
  final LocalStoragePreferencesService localStoragePrefService;

  LocalStoragePrefRepository({
    required this.localStoragePrefService,
  });

  FutureOr<void> hideSplashPageToStartup() async =>
      localStoragePrefService.hideSplashPageToStartup();

  FutureOr<void> showSplashPageToStartup() async =>
      localStoragePrefService.showSplashPageToStartup();

  FutureOr<bool?> get showSplashPage async =>
      localStoragePrefService.showSplashPage;
}
