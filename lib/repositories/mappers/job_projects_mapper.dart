import 'package:offertelavoroflutter_it_app/models/job_details/job_description_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_text_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_details_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/utilities/mapper_utilities.dart';
import 'package:offertelavoroflutter_it_app/services/network/dto/jobs_response.dart';
import 'package:pine/pine.dart';

class JobProjectsMapper extends DTOMapper<JobsResponse, JobProjectModel> {
  @override
  JobProjectModel fromDTO(JobsResponse dto) => JobProjectModel(
        id: dto.id,
        createdTime: DateTime.tryParse(dto.createdTime),
        lastEditedTime: DateTime.tryParse(dto.lastEditedTime),
        archived: dto.archived,
        projectDetails: JobProjectDetailsModel(),
      );

  @override
  JobsResponse toDTO(JobProjectModel model) => throw UnimplementedError();

  _getMapping(PropertyItemDTO item) {
    final type = item.typeField;
    final nameField = item.nameField;

    switch (nameField) {
      case "Nome azienda":
        JobTextModel nameCompany;

        if (type == "text" || type == "title" || type == "rich_text") {
          nameCompany =
              MapperUtilities().getValues(type, item.valueField).first;
        } else {
          nameCompany = JobTextModel(text: "Vuoto");
        }

        return nameCompany;

      case "Descrizione offerta":
        JobDescriptionModel jobDescription;

        if (type == "text" || type == "rich_text") {
          jobDescription = JobDescriptionModel(
              descriptionItems:
                  MapperUtilities().getValues(type, item.valueField));
        } else {
          jobDescription = const JobDescriptionModel(descriptionItems: []);
        }

        return jobDescription;
      default:
    }
  }
}
