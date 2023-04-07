import 'package:offertelavoroflutter_it_app/errors/network_error.dart';
import 'package:offertelavoroflutter_it_app/errors/repository_error.dart';
import 'package:offertelavoroflutter_it_app/models/job_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/job_mapper.dart';
import 'package:offertelavoroflutter_it_app/services/network/jobs_services.dart';

class JobRepository {
  final JobsService service;
  final JobMapper jobMapper;

  JobRepository({
    required this.service,
    required this.jobMapper,
  });

  Future<List<JobModel>> jobs(String databaseId) async {
    try {
      final response = await service.fetchJobs(databaseId);

      return response.map(jobMapper.fromDTO).toList(growable: false);
    } on NetworkError catch (e) {
      throw RepositoryError(e.reasonPhrase);
    } catch (e) {
      throw RepositoryError();
    }
  }
}
