// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendedModel _$RecommendedModelFromJson(Map<String, dynamic> json) =>
    _RecommendedModel(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      description: json['description'] as String,
      badge: json['badge'] as String,
      fileSizeLabel: json['fileSizeLabel'] as String,
      fileSizeBytes: (json['fileSizeBytes'] as num).toInt(),
      downloadUrl: json['downloadUrl'] as String,
      fileName: json['fileName'] as String,
      ramRequirement: json['ramRequirement'] as String,
    );

Map<String, dynamic> _$RecommendedModelToJson(_RecommendedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'description': instance.description,
      'badge': instance.badge,
      'fileSizeLabel': instance.fileSizeLabel,
      'fileSizeBytes': instance.fileSizeBytes,
      'downloadUrl': instance.downloadUrl,
      'fileName': instance.fileName,
      'ramRequirement': instance.ramRequirement,
    };
