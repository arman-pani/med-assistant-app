import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_download_state.freezed.dart';
part 'model_download_state.g.dart';

@freezed
abstract class ModelDownloadState with _$ModelDownloadState {
  const ModelDownloadState._();

  const factory ModelDownloadState({
    @Default(0.0) double progress,
    @Default(0) int receivedBytes,
    @Default(0) int totalBytes,
    @Default(false) bool isDownloading,
    @Default(false) bool isDownloaded,
    @Default(false) bool isDownloadingProjector,
    @Default(0.0) double projectorProgress,
    @Default(0) int projectorReceivedBytes,
    String? error,
  }) = _ModelDownloadState;

  factory ModelDownloadState.fromJson(Map<String, dynamic> json) =>
      _$ModelDownloadStateFromJson(json);

  String get progressLabel {
    if (totalBytes == 0) return '';
    final receivedGb = receivedBytes / 1073741824;
    final totalGb = totalBytes / 1073741824;
    final pct = (progress * 100).toStringAsFixed(0);
    return '${receivedGb.toStringAsFixed(2)} GB / ${totalGb.toStringAsFixed(2)} GB ($pct%)';
  }

  String get remainingLabel {
    if (totalBytes == 0) return '';
    final remainingBytes = totalBytes - receivedBytes;
    if (remainingBytes <= 0) return 'Almost done...';
    final remainingGb = remainingBytes / 1073741824;
    return '${remainingGb.toStringAsFixed(2)} GB remaining';
  }

  String get projectorProgressLabel {
    // Projector size is typically around 624 MB
    final totalMb = 624.0;
    final receivedMb = projectorReceivedBytes / 1048576;
    final pct = (projectorProgress * 100).toStringAsFixed(0);
    return '${receivedMb.toStringAsFixed(1)} MB / ${totalMb.toStringAsFixed(1)} MB ($pct%)';
  }

  String get projectorRemainingLabel {
    final projectorTotalBytes = 654311424; // from RecommendedModel catalog
    final remainingBytes = projectorTotalBytes - projectorReceivedBytes;
    if (remainingBytes <= 0) return 'Almost done...';
    final remainingMb = remainingBytes / 1048576;
    return '${remainingMb.toStringAsFixed(1)} MB remaining';
  }
}
