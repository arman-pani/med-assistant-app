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
      projectorDownloadUrl: json['projectorDownloadUrl'] as String?,
      projectorFileName: json['projectorFileName'] as String?,
      projectorSizeLabel: json['projectorSizeLabel'] as String?,
      projectorSizeBytes: (json['projectorSizeBytes'] as num?)?.toInt() ?? 0,
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
      'projectorDownloadUrl': instance.projectorDownloadUrl,
      'projectorFileName': instance.projectorFileName,
      'projectorSizeLabel': instance.projectorSizeLabel,
      'projectorSizeBytes': instance.projectorSizeBytes,
    };
