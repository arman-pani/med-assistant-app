// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_download_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModelDownloadState _$ModelDownloadStateFromJson(Map<String, dynamic> json) =>
    _ModelDownloadState(
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      receivedBytes: (json['receivedBytes'] as num?)?.toInt() ?? 0,
      totalBytes: (json['totalBytes'] as num?)?.toInt() ?? 0,
      isDownloading: json['isDownloading'] as bool? ?? false,
      isDownloaded: json['isDownloaded'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ModelDownloadStateToJson(_ModelDownloadState instance) =>
    <String, dynamic>{
      'progress': instance.progress,
      'receivedBytes': instance.receivedBytes,
      'totalBytes': instance.totalBytes,
      'isDownloading': instance.isDownloading,
      'isDownloaded': instance.isDownloaded,
      'error': instance.error,
    };
