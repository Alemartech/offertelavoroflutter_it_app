import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_team_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_text_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_url_model.dart';
import 'package:offertelavoroflutter_it_app/services/network/dto/jobs_response.dart';

class MapperUtilities {
  getValues(String type, PropType<dynamic>? item) {
    if (item?.values == null) return null;

    switch (type) {
      case "checkbox":
        return (item as PropType<ChechBoxTypeProp>).values!.checkbox;

      case "created_by":
        return (item as PropType<CreatedByTypeProp>).values!.object;

      case "created_time":
        return DateTime.tryParse(
            (item as PropType<CreatedTimeTypeProp>).values!.createdTime);

      /*  case "date":
        final end = (item as PropType<DateTypeProp>).values!.end;
        return DateTypeModel(
          start: DateTime.tryParse((item).values!.start),
          end: end != "" ? DateTime.tryParse((item).values!.end) : null,
        );*/

      case "email":
        return (item as PropType<EmailTypeProp>).values!.email;

      /*  case "files":
        return (item as PropType<List<FilesTypeProp>>)
            .values!
            .map(
              (file) => FileTypeModel(name: file.name, url: file.url),
            )
            .toList(growable: false);*/

      case "last_edited_by":
        return (item as PropType<LastEditedByTypeProp>).values!.object;

      case "last_edited_time":
        return DateTime.tryParse(
            (item as PropType<LastEditedTimeTypeProp>).values!.lastEditedTime);

      /*  case "multi_select":
        return (item as PropType<List<MultiSelectTypeProp>>)
            .values!
            .map((multiSelect) => MultiSelectTypeModel(
                name: multiSelect.name,
                color: _getMaterialColor(multiSelect.color)))
            .toList(growable: false);*/

      case "number":
        return (item as PropType<NumberTypeProp>).values!.number;

      /*  case "people":
        return (item as PropType<List<PeopleTypeProp>>)
            .values!
            .map((people) => UserObjectModel(
                  id: people.object.id,
                  name: people.object.name,
                  avatarUrl: people.object.avatarUrl,
                ))
            .toList(growable: false);*/

      case "phone_number":
        return (item as PropType<PhoneNumberTypeProp>).values!.phoneNumber;

      /*  case "rollup":
        return (item as PropType<List<RollupTypeProp>>)
            .values!
            .map((rollup) => RollupTypeModel(
                  rollupName: rollup.rollupPropertyName,
                  relationName: rollup.relationPropertyName,
                  rollupId: rollup.rollupPropertyId,
                  relationId: rollup.relationPropertyId,
                  function: rollup.function,
                ))
            .toList(growable: false);*/

      case "rich_text":
        if ((item as PropType<List<RichTextTypeProp>>).values!.isEmpty) {
          return null;
        }
        return (item as PropType<List<RichTextTypeProp>>)
            .values!
            .map(
              (richText) => JobTextModel(
                text: richText.text.content,
                url: richText.text.link?.url,
                plainText: richText.plainText,
                href: richText.href,
                style: TextStyle(
                  decoration: richText.annotations.underline
                      ? TextDecoration.overline
                      : null,
                  fontWeight:
                      richText.annotations.bold ? FontWeight.bold : null,
                  fontStyle:
                      richText.annotations.italic ? FontStyle.italic : null,
                  color: _getMaterialColor(richText.annotations.color),
                ),
              ),
            )
            .toList(growable: false);

      case "title":
        return (item as PropType<List<TitleTypeProp>>)
            .values!
            .map((richText) => JobTextModel(
                  text: richText.text.content,
                  url: richText.text.link?.url,
                  plainText: richText.plainText,
                  href: richText.href,
                  style: TextStyle(
                    decoration: richText.annotations.underline
                        ? TextDecoration.overline
                        : null,
                    fontWeight:
                        richText.annotations.bold ? FontWeight.bold : null,
                    fontStyle:
                        richText.annotations.italic ? FontStyle.italic : null,
                    color: _getMaterialColor(richText.annotations.color),
                  ),
                ))
            .toList(growable: false);

      case "select":
        return JobSelectModel(
          text: (item as PropType<SelectTypeProp>).values!.name,
          sectionColor: _getMaterialColor(
              (item as PropType<SelectTypeProp>).values!.color),
        );

      case "url":
        return JobUrlModel(url: (item as PropType<UrlTypeProp>).values!.url);

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
