part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<JobRepository>(
    create: (context) => JobRepository(
      service: context.read<JobsService>(),
      jobMapper: context.read<JobMapper>(),
      secureStorage: context.read<FlutterSecureStorage>(),
    ),
  ),
];
