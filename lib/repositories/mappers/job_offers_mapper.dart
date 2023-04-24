import 'package:offertelavoroflutter_it_app/models/job_details/job_created_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_description_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_team_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_text_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_url_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_details_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/utilities/mapper_utilities.dart';
import 'package:offertelavoroflutter_it_app/services/network/dto/jobs_response.dart';
import 'package:pine/pine.dart';

class JobOffersMapper extends DTOMapper<JobsResponse, JobOfferModel> {
  @override
  JobOfferModel fromDTO(JobsResponse dto) => JobOfferModel(
        id: dto.id,
        createdTime: DateTime.tryParse(dto.createdTime),
        lastEditedTime: DateTime.tryParse(dto.lastEditedTime),
        archived: dto.archived,
        jobDetails: JobOfferDetailsModel(
          jobCreatedTime: _getMapping(dto.properties
              .where((property) => property.nameField == "Job Posted")
              .first),
          team: _getMapping(dto.properties
              .where((property) => property.nameField == "Team")
              .first),
          agreement: _getMapping(dto.properties
              .where((property) => property.nameField == "Contratto")
              .first),
          seniority: _getMapping(dto.properties
              .where((property) => property.nameField == "Seniority")
              .first),
          ral: _getMapping(dto.properties
              .where((property) => property.nameField == "RAL")
              .first),
          jobPosition: _getMapping(dto.properties
              .where((property) => property.nameField == "Name")
              .first),
          jobQualification: _getMapping(dto.properties
              .where((property) => property.nameField == "Qualifica")
              .first),
          jobSalary: _getMapping(dto.properties
              .where((property) => property.nameField == "Retribuzione")
              .first),
          nameCompany: _getMapping(dto.properties
              .where((property) => property.nameField == "Nome azienda")
              .first),
          jobDescription: _getMapping(dto.properties
              .where((property) => property.nameField == "Descrizione offerta")
              .first),
          howToApply: _getMapping(dto.properties
              .where((property) => property.nameField == "Come candidarsi")
              .first),
          locality: _getMapping(dto.properties
              .where((property) => property.nameField == "Località")
              .first),
          jobPublicationStatus: _getMapping(dto.properties
              .where(
                  (property) => property.nameField == "Stato di pubblicazione")
              .first),
          urlWebSiteCompany: _getMapping(dto.properties
              .where((property) => property.nameField == "URL sito web")
              .first),
        ),
      );

  @override
  JobsResponse toDTO(JobOfferModel model) => throw UnimplementedError();

  _getMapping(PropertyItemDTO item) {
    final type = item.typeField;
    final nameField = item.nameField;

    switch (nameField) {
      case "Job Posted":
        if (type == "created_time") {
          return JobCreatedModel(
            created: MapperUtilities().getValues(type, item.valueField),
          );
        } else {
          return null;
        }

      case "Team":
      case "Contratto":
      case "Seniority":
      case "RAL":
        JobSelectModel? data;

        if (type == "select") {
          data = MapperUtilities().getValues(type, item.valueField);
        } else {
          data = null;
        }
        return data;

      case "Nome azienda":
      case "Name":
      case "Qualifica":
      case "Retribuzione":
      case "Come candidarsi":
      case "Località":
      case "Stato di pubblicazione":
        JobTextModel? data;

        if (type == "text" || type == "title" || type == "rich_text") {
          data = MapperUtilities().getValues(type, item.valueField)?.first;
        } else {
          data = null;
        }

        return data;

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

      case "URL sito web":
        JobUrlModel? url;

        if (type == "url") {
          url = MapperUtilities().getValues(type, item.valueField);
        } else {
          url = null;
        }

        return url;

      default:
    }
  }
}
