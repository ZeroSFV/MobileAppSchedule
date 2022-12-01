import 'package:json_annotation/json_annotation.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
part 'notesJson.g.dart';

@JsonSerializable()
class NotesJson {
  late String course;
  late String group;
  late String subgroup;
  late String day;
  late String week;
  late String note;

  NotesJson(
      this.course, this.group, this.subgroup, this.day, this.week, this.note) {
    create();
  }

  void create() async {
    String path = await _localPath;
    if (await File('$path/' +
                course +
                '_' +
                group +
                '_' +
                subgroup +
                '_' +
                day +
                '_' +
                week +
                '.json')
            .exists() ==
        false) {
      final String response = await rootBundle.loadString('assets/notes.json');
      final data = await json.decode(response);
      // course = data["course"];
      // group = data["group"];
      // subgroup = data["subgroup"];
      // day = data["day"];
      // week = data["week"];
      note = data["note"];
    } else {
      final file = await _localFile;
      final contents = await file.readAsString();
      if (contents != "") {
        Map<String, dynamic> jsonMap = jsonDecode(contents);
        NotesJson json = NotesJson.fromJson(jsonMap);
        note = json.note;
      } else {
        final String response =
            await rootBundle.loadString('assets/notes.json');
        final data = await json.decode(response);
        course = data["course"];
        group = data["group"];
        subgroup = data["subgroup"];
        day = data["day"];
        week = data["week"];
        note = data["note"];
      }
    }
  }

  factory NotesJson.fromJson(Map<String, dynamic> json) =>
      _$NotesJsonFromJson(json);
  Map<String, dynamic> toJson() => _$NotesJsonToJson(this);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/' +
        course +
        '_' +
        group +
        '_' +
        subgroup +
        '_' +
        day +
        '_' +
        week +
        '.json');
  }

  Future<File> writeJson() async {
    final file = await _localFile;

    return file.writeAsString(jsonEncode(this));
  }
}
