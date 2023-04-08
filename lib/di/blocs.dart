part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<ThemeCubit>(
    create: (_) => ThemeCubit(),
  ),
  BlocProvider<JobOffersBloc>(
    create: (context) => JobOffersBloc(
      jobRepository: context.read<JobRepository>(),
    ),
  ),
];
