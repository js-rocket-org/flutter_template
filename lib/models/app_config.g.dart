// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      defaultLanguage: json['defaultLanguage'] as String? ?? 'en',
      ranOnce: json['ranOnce'] as bool? ?? false,
    );

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'isDarkMode': instance.isDarkMode,
      'defaultLanguage': instance.defaultLanguage,
      'ranOnce': instance.ranOnce,
    };
