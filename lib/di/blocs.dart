part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<ThemeCubit>(
    create: (_) => ThemeCubit(),
  ),
  BlocProvider<JobOffersBloc>(
    create: (context) => JobOffersBloc(
      jobRepository: context.read<JobRepository>(),
    )..fetchJobs(),
  ),
  BlocProvider<JobProjectsBloc>(
    create: (context) => JobProjectsBloc(
      jobRepository: context.read<JobRepository>(),
    )..fetchProjects(),
  ),
  BlocProvider<SplashPagePrefBloc>(
    create: (context) => SplashPagePrefBloc(
      localStoragePrefRepository: context.read<LocalStoragePrefRepository>(),
    )..fetchSplashPagePref(),
  ),
];
