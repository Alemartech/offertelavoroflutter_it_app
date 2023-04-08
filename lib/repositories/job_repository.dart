import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:offertelavoroflutter_it_app/errors/network_error.dart';
import 'package:offertelavoroflutter_it_app/errors/repository_error.dart';
import 'package:offertelavoroflutter_it_app/models/bookmark_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/job_mapper.dart';
import 'package:offertelavoroflutter_it_app/services/network/jobs_services.dart';

class JobRepository {
  static const _kBaseKeyBookmark = "bookmark_";

  final JobsService service;
  final JobMapper jobMapper;
  final FlutterSecureStorage secureStorage;

  JobRepository({
    required this.service,
    required this.jobMapper,
    required this.secureStorage,
  });

  Future<List<JobModel>> jobs(String databaseId) async {
    try {
      final response = await service.fetchJobs(databaseId);

      return response.map(jobMapper.fromDTO).toList(growable: false);
    } on NetworkError catch (e, stack) {
      throw RepositoryError(e.reasonPhrase, stack.toString());
    } catch (e) {
      throw RepositoryError(e.toString());
    }
  }

  Future<void> createBookmark(String jobId) async {
    final BookmarkModel bookmark = BookmarkModel(id: jobId);

    final encodeJson = bookmark.toJson;
    final json = jsonEncode(encodeJson);

    await secureStorage.write(key: _kBaseKeyBookmark + jobId, value: json);
  }

  Future<bool> checkBookmark(String jobId) async {
    final json = await secureStorage.read(key: _kBaseKeyBookmark + jobId);

    return json != null ? true : false;
  }

  Future<void> deleteBookmarK(String jobId) async =>
      await secureStorage.delete(key: _kBaseKeyBookmark + jobId);
}
