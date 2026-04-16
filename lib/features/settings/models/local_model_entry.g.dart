// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalModelEntry _$LocalModelEntryFromJson(Map<String, dynamic> json) =>
    _LocalModelEntry(
      path: json['path'] as String,
      displayName: json['displayName'] as String,
      catalogId: json['catalogId'] as String?,
      fileSizeLabel: json['fileSizeLabel'] as String?,
      badge: json['badge'] as String?,
      isCustom: json['isCustom'] as bool? ?? false,
    );

Map<String, dynamic> _$LocalModelEntryToJson(_LocalModelEntry instance) =>
    <String, dynamic>{
      'path': instance.path,
      'displayName': instance.displayName,
      'catalogId': instance.catalogId,
      'fileSizeLabel': instance.fileSizeLabel,
      'badge': instance.badge,
      'isCustom': instance.isCustom,
    };
