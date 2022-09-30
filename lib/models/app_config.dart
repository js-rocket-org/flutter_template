// App configuration variables.  Only define variables you want to store here
// For variables that can be kept in state memory put in the provider instead.

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig {
  bool isDarkMode;
  String defaultLanguage;
  bool ranOnce; // used to detect first time app was installed and run

  AppConfig({
    this.isDarkMode = false,
    this.defaultLanguage = 'en',
    this.ranOnce = false,
  });

  String toJsonString() => jsonEncode(_$AppConfigToJson(this));

  static AppConfig fromJsonString(String appconfigJson) =>
      _$AppConfigFromJson(jsonDecode(appconfigJson));
}
