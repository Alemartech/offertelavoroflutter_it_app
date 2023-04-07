import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/models/job_details_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_model.dart';
import 'package:offertelavoroflutter_it_app/services/network/dto/jobs_response.dart';
import 'package:pine/pine.dart';

class JobMapper extends DTOMapper<JobsResponse, JobModel> {
  @override
  JobModel fromDTO(JobsResponse dto) => JobModel(
        id: dto.id,
        createdTime: DateTime.tryParse(dto.createdTime),
        lastEditedTime: DateTime.tryParse(dto.lastEditedTime),
        archived: dto.archived,
        jobbDetails: dto.properties
            .map((propertyDTO) => JobDetailsModel(
                  nameField: propertyDTO.nameField,
                  typeField: propertyDTO.typeField,
                  checkBoxValue:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  createdTimeValue:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  dateValue:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  emailValue:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  filesValues:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  lastEditedByValues:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  lastEditedTimeValue:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  numberValue:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  peopleValues:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  phoneNumberValue:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  rollupValues:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  richTextValues:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  titleValues:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  selectValues:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                  urlValue:
                      _getValues(propertyDTO.typeField, propertyDTO.valueField),
                ))
            .toList(growable: false),
      );

  @override
  JobsResponse toDTO(JobModel model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }

  _getValues(String type, PropType<dynamic>? item) {
    switch (type) {
      case "checkbox":
        return (item as PropType<ChechBoxTypeProp>).values!.checkbox;

      case "created_by":
        return (item as PropType<CreatedByTypeProp>).values!.object;

      case "created_time":
        return DateTime.tryParse(
            (item as PropType<CreatedTimeTypeProp>).values!.createdTime);

      case "date":
        final end = (item as PropType<DateTypeProp>).values!.end;
        return DateTypeModel(
          start: DateTime.tryParse((item).values!.start),
          end: end != "" ? DateTime.tryParse((item).values!.end) : null,
        );

      case "email":
        return (item as PropType<EmailTypeProp>).values!.email;

      case "files":
        return (item as PropType<List<FilesTypeProp>>)
            .values!
            .map(
              (file) => FileTypeModel(name: file.name, url: file.url),
            )
            .toList(growable: false);

      case "last_edited_by":
        return (item as PropType<LastEditedByTypeProp>).values!.object;

      case "last_edited_time":
        return DateTime.tryParse(
            (item as PropType<LastEditedTimeTypeProp>).values!.lastEditedTime);

      case "multi_select":
        return (item as PropType<List<MultiSelectTypeProp>>)
            .values!
            .map((multiSelect) => MultiSelectTypeModel(
                name: multiSelect.name,
                color: _getMaterialColor(multiSelect.color)))
            .toList(growable: false);

      case "number":
        return (item as PropType<NumberTypeProp>).values!.number;

      case "people":
        return (item as PropType<List<PeopleTypeProp>>)
            .values!
            .map((people) => UserObjectModel(
                  id: people.object.id,
                  name: people.object.name,
                  avatarUrl: people.object.avatarUrl,
                ))
            .toList(growable: false);

      case "phone_number":
        return (item as PropType<PhoneNumberTypeProp>).values!.phoneNumber;

      case "rollup":
        return (item as PropType<List<RollupTypeProp>>)
            .values!
            .map((rollup) => RollupTypeModel(
                  rollupName: rollup.rollupPropertyName,
                  relationName: rollup.relationPropertyName,
                  rollupId: rollup.rollupPropertyId,
                  relationId: rollup.relationPropertyId,
                  function: rollup.function,
                ))
            .toList(growable: false);

      case "rich_text":
        return (item as PropType<List<RichTextTypeProp>>)
            .values!
            .map((richText) => RichTextTypeModel(
                  content: richText.text.content,
                  contentLinkUrl: richText.text.link?.url,
                  plainText: richText.plainText,
                  href: richText.href,
                  annotations: AnnotationsTypeModel(
                    bold: richText.annotations.bold,
                    italic: richText.annotations.italic,
                    strikethrough: richText.annotations.strikethrough,
                    underline: richText.annotations.underline,
                    code: richText.annotations.code,
                    color: _getMaterialColor(richText.annotations.color),
                  ),
                ));

      case "title":
        return (item as PropType<List<RichTextTypeProp>>)
            .values!
            .map((richText) => RichTextTypeModel(
                  content: richText.text.content,
                  contentLinkUrl: richText.text.link?.url,
                  plainText: richText.plainText,
                  href: richText.href,
                  annotations: AnnotationsTypeModel(
                    bold: richText.annotations.bold,
                    italic: richText.annotations.italic,
                    strikethrough: richText.annotations.strikethrough,
                    underline: richText.annotations.underline,
                    code: richText.annotations.code,
                    color: _getMaterialColor(richText.annotations.color),
                  ),
                ));

      case "select":
        return SelectTypeModel(
          name: (item as PropType<SelectTypeProp>).values!.name,
          color: _getMaterialColor(
              (item as PropType<SelectTypeProp>).values!.color),
        );

      case "url":
        return (item as PropType<UrlTypeProp>).values!.url;

      default:
        return null;
    }
  }

  Color _getMaterialColor(String color) {
    switch (color) {
      case "blue":
        return Colors.blue;

      case "brown":
        return Colors.brown;

      case "gray":
        return Colors.grey;

      case "green":
        return Colors.green;

      case "orange":
        return Colors.orange;

      case "pink":
        return Colors.pink;

      case "purple":
        return Colors.purple;

      case "red":
        return Colors.red;

      case "yellow":
        return Colors.yellow;

      default:
        return Colors.transparent;
    }
  }
}
