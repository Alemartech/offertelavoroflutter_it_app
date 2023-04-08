import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/models/job_model.dart';

part 'job_projects_event.dart';
part 'job_projects_state.dart';

class JobProjectsBloc extends Bloc<JobProjectsEvent, JobProjectsState> {
  JobProjectsBloc() : super(JobProjectsFetching()) {
    on<JobProjectsFetchEvent>(_fetchProjects);
  }

  Future<void> _fetchProjects(
      JobProjectsFetchEvent event, Emitter emit) async {}
}
