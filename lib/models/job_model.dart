import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/models/job_details_model.dart';

class JobModel extends Equatable {
  final String id;
  final DateTime? createdTime;
  final DateTime? lastEditedTime;
  final bool archived;
  final List<JobDetailsModel> jobbDetails;

  const JobModel({
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.archived,
    required this.jobbDetails,
  });

  @override
  List<Object?> get props =>
      [id, createdTime, lastEditedTime, archived, jobbDetails];
}
