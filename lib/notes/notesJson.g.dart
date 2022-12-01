// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notesJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesJson _$NotesJsonFromJson(Map<String, dynamic> json) => NotesJson(
    json['course'] as String,
    json['group'] as String,
    json['subgroup'] as String,
    json['day'] as String,
    json['week'] as String,
    json['note'] as String);

Map<String, dynamic> _$NotesJsonToJson(NotesJson instance) => <String, dynamic>{
      'course': instance.course,
      'group': instance.group,
      'subgroup': instance.subgroup,
      'day': instance.day,
      'week': instance.week,
      'note': instance.note,
    };
