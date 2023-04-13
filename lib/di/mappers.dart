part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<JobMapper>(
    create: (_) => JobMapper(),
  ),
];
