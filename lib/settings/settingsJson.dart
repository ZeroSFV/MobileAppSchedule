import 'package:json_annotation/json_annotation.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
part 'settingsJson.g.dart';

@JsonSerializable()
class SettingsJson {
  late String course;
  late String group;
  late String subgroup;

  SettingsJson(this.course, this.group, this.subgroup) {
    create();
  }

  void create() async {
    String path = await _localPath;
    if (await File('$path/settings.json').exists() == false) {
      final String response =
          await rootBundle.loadString('assets/settings.json');
      final data = await json.decode(response);
      course = data["course"];
      group = data["group"];
      subgroup = data["subgroup"];
    } else {
      final file = await _localFile;
      final contents = await file.readAsString();
      if (contents != "") {
        Map<String, dynamic> jsonMap = jsonDecode(contents);
        SettingsJson json = SettingsJson.fromJson(jsonMap);
        course = json.course;
        group = json.group;
        subgroup = json.subgroup;
      } else {
        final String response =
            await rootBundle.loadString('assets/settings.json');
        final data = await json.decode(response);
        course = data["course"];
        group = data["group"];
        subgroup = data["subgroup"];
      }
    }
  }

  factory SettingsJson.fromJson(Map<String, dynamic> json) =>
      _$SettingsJsonFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsJsonToJson(this);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/settings.json');
  }

  Future<File> writeJson() async {
    final file = await _localFile;

    return file.writeAsString(jsonEncode(this));
  }
}
