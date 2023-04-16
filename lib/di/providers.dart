part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
  Provider<Logger>(
    create: (_) => Logger(),
  ),
  Provider<JobsService>(
    create: (_) => JobsService(baseUrl: "https://api.notion.com/v1"),
  ),
  Provider<FlutterSecureStorage>(
    create: (_) => const FlutterSecureStorage(),
  ),
  Provider<LocalStoragePreferencesService>(
    create: (context) => LocalStoragePreferencesService(
      sharedPrefFuture: SharedPreferences.getInstance(),
    ),
  ),
];
