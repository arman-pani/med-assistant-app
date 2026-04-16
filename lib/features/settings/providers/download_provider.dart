import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/model_download_service.dart';
import '../models/model_download_state.dart';
import 'model_catalog_provider.dart';

export '../models/model_download_state.dart';

part 'download_provider.g.dart';

@riverpod
class DownloadNotifier extends _$DownloadNotifier {
  @override
  ModelDownloadState build(String modelId) {
    return const ModelDownloadState();
  }

  Future<void> checkIfDownloaded(RecommendedModel model) async {
    final serviceAsync = await ref.read(modelDownloadServiceProvider.future);
    state = state.copyWith(isDownloaded: serviceAsync.isDownloaded(model));
  }

  Future<void> startDownload(RecommendedModel model) async {
    final service = await ref.read(modelDownloadServiceProvider.future);
    state = state.copyWith(
      isDownloading: true,
      error: null,
      progress: 0.0,
      receivedBytes: 0,
      totalBytes: model.fileSizeBytes,
    );
    await service.downloadModel(
      model,
      onProgress: (received, fraction) {
        state = state.copyWith(
          progress: fraction,
          receivedBytes: received,
          totalBytes: model.fileSizeBytes,
        );
      },
      onComplete: () {
        state = state.copyWith(
          isDownloading: false,
          isDownloaded: true,
          progress: 1.0,
          receivedBytes: model.fileSizeBytes,
          totalBytes: model.fileSizeBytes,
        );
        ref
            .read(modelCatalogProvider.notifier)
            .onCatalogModelDownloaded(model);
      },
      onError: (e) {
        state = state.copyWith(
          isDownloading: false,
          error: e,
          progress: 0.0,
          receivedBytes: 0,
        );
      },
    );
  }

  Future<void> cancelDownload(RecommendedModel model) async {
    final service = await ref.read(modelDownloadServiceProvider.future);
    await service.cancelDownload(model);
    state = state.copyWith(isDownloading: false, progress: 0.0);
  }

  Future<void> deleteModel(RecommendedModel model) async {
    final service = await ref.read(modelDownloadServiceProvider.future);
    await service.deleteModel(model);
    state = state.copyWith(isDownloaded: false, progress: 0.0);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
