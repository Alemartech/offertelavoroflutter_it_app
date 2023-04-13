// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class JobDetailsModel extends Equatable {
  final String nameField;
  final String typeField;
  final bool? checkBoxValue;
  final UserObjectModel? createdByValues;
  final DateTime? createdTimeValue;
  final DateTypeModel? dateValue;
  final String? emailValue;
  final List<FileTypeModel>? filesValues;
  final UserObjectModel? lastEditedByValues;
  final DateTime? lastEditedTimeValue;
  final List<MultiSelectTypeModel>? multiSelectValues;
  final int? numberValue;
  final List<UserObjectModel>? peopleValues;
  final String? phoneNumberValue;
  final List<RollupTypeModel>? rollupValues;
  final List<RichTextTypeModel>? richTextValues;
  final List<RichTextTypeModel>? titleValues;
  final SelectTypeModel? selectValues;
  final String? urlValue;

  const JobDetailsModel({
    required this.nameField,
    required this.typeField,
    this.checkBoxValue,
    this.createdByValues,
    this.createdTimeValue,
    this.dateValue,
    this.emailValue,
    this.filesValues,
    this.lastEditedByValues,
    this.lastEditedTimeValue,
    this.multiSelectValues,
    this.numberValue,
    this.peopleValues,
    this.phoneNumberValue,
    this.rollupValues,
    this.richTextValues,
    this.titleValues,
    this.selectValues,
    this.urlValue,
  });

  @override
  List<Object?> get props => [];
}

class AnnotationsTypeModel extends Equatable {
  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final Color color;

  const AnnotationsTypeModel({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    required this.color,
  });

  @override
  List<Object?> get props => [
        bold,
        italic,
        strikethrough,
        underline,
        code,
        color,
      ];
}

class DateTypeModel extends Equatable {
  final DateTime? start;
  final DateTime? end;

  const DateTypeModel({
    this.start,
    this.end,
  });

  @override
  List<Object?> get props => [start, end];
}

class FileTypeModel extends Equatable {
  final String name;
  final String url;

  const FileTypeModel({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [name, url];
}

class MultiSelectTypeModel extends Equatable {
  final String name;
  final Color color;

  const MultiSelectTypeModel({
    required this.name,
    required this.color,
  });

  @override
  List<Object?> get props => [name, color];
}

class RollupTypeModel extends Equatable {
  final String rollupName;
  final String relationName;
  final String rollupId;
  final String relationId;
  final String function;

  const RollupTypeModel({
    required this.rollupName,
    required this.relationName,
    required this.rollupId,
    required this.relationId,
    required this.function,
  });

  @override
  List<Object?> get props =>
      [rollupName, relationName, rollupId, relationId, function];
}

class RichTextTypeModel extends Equatable {
  final String content;
  final String? contentLinkUrl;
  final String plainText;
  final String? href;
  final AnnotationsTypeModel annotations;

  const RichTextTypeModel({
    required this.content,
    this.contentLinkUrl,
    required this.plainText,
    this.href,
    required this.annotations,
  });

  @override
  List<Object?> get props =>
      [content, contentLinkUrl, plainText, href, annotations];
}

class SelectTypeModel extends Equatable {
  final String name;
  final Color color;

  const SelectTypeModel({
    required this.name,
    required this.color,
  });

  @override
  List<Object?> get props => [name, color];
}

class StatusTypeModel extends Equatable {
  final String name;
  final Color color;

  const StatusTypeModel({
    required this.name,
    required this.color,
  });

  @override
  List<Object?> get props => [name, color];
}

class UserObjectModel extends Equatable {
  final String id;
  final String? name;
  final String? avatarUrl;

  const UserObjectModel({
    required this.id,
    this.name,
    this.avatarUrl,
  });
  @override
  List<Object?> get props => [id, name, avatarUrl];
}
