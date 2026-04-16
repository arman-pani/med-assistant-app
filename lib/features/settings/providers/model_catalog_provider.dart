import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/recommended_model.dart';
import '../../../core/services/model_download_service.dart';
import '../../../core/services/model_persistence_service.dart';
import '../../chat/providers/chat_provider.dart';
import '../models/local_model_entry.dart';
import '../models/model_catalog_state.dart';

export '../models/local_model_entry.dart';
export '../models/model_catalog_state.dart';

part 'model_catalog_provider.g.dart';

@Riverpod(keepAlive: true)
class ModelCatalogNotifier extends _$ModelCatalogNotifier {
  @override
  ModelCatalogState build() {
    Future.microtask(() => _init());
    return const ModelCatalogState();
  }

  Future<void> _init() async {
    final downloadService = await ref.read(modelDownloadServiceProvider.future);
    final persistService = await ref.read(
      modelPersistenceServiceProvider.future,
    );
    final persisted = await persistService.load();

    final List<LocalModelEntry> local = [];

    for (final model in RecommendedModel.catalog) {
      if (downloadService.isDownloaded(model)) {
        local.add(
          LocalModelEntry(
            path: downloadService.localPath(model),
            displayName: model.displayName,
            catalogId: model.id,
            fileSizeLabel: model.fileSizeLabel,
            badge: model.badge,
          ),
        );
      }
    }

    for (final path in persisted.customPaths) {
      if (File(path).existsSync()) {
        final fileName = path.split('/').last;
        local.add(
          LocalModelEntry(path: path, displayName: fileName, isCustom: true),
        );
      }
    }

    String? loadedPath = persisted.loadedModelPath;
    if (loadedPath != null && !File(loadedPath).existsSync()) {
      loadedPath = null;
      await persistService.clearLoadedModel();
    }

    state = state.copyWith(localModels: local, loadedModelPath: loadedPath);

    if (loadedPath != null) {
      await _loadIntoEngine(
        path: loadedPath,
        displayName: persisted.loadedModelName ?? loadedPath.split('/').last,
        persist: false,
      );
    }
  }

  Future<void> loadModel({
    required String path,
    required String displayName,
  }) async {
    await _loadIntoEngine(path: path, displayName: displayName, persist: true);
  }

  Future<void> _loadIntoEngine({
    required String path,
    required String displayName,
    required bool persist,
  }) async {
    state = state.copyWith(
      isLoadingModel: true,
      loadingModelPath: path,
      errorMessage: null,
    );
    try {
      await ref.read(chatProvider.notifier).loadModelPath(path);
      state = state.copyWith(
        loadedModelPath: path,
        isLoadingModel: false,
        loadingModelPath: null,
      );
      if (persist) {
        final persistService = await ref.read(
          modelPersistenceServiceProvider.future,
        );
        await persistService.setLoadedModel(path, displayName);
      }
    } catch (e) {
      state = state.copyWith(
        isLoadingModel: false,
        loadingModelPath: null,
        errorMessage: 'Failed to load model: ${e.toString()}',
      );
    }
  }

  Future<void> addCustomModel(String path) async {
    if (path.trim().isEmpty) return;
    if (!File(path).existsSync()) {
      state = state.copyWith(errorMessage: 'File not found at path: $path');
      return;
    }
    if (!path.endsWith('.gguf')) {
      state = state.copyWith(errorMessage: 'File must be a .gguf file.');
      return;
    }

    final persistService = await ref.read(
      modelPersistenceServiceProvider.future,
    );
    await persistService.addCustomPath(path);

    final fileName = path.split('/').last;
    final entry = LocalModelEntry(
      path: path,
      displayName: fileName,
      isCustom: true,
    );

    state = state.copyWith(localModels: [...state.localModels, entry]);
  }

  Future<void> onCatalogModelDownloaded(RecommendedModel model) async {
    final downloadService = await ref.read(modelDownloadServiceProvider.future);
    final entry = LocalModelEntry(
      path: downloadService.localPath(model),
      displayName: model.displayName,
      catalogId: model.id,
      fileSizeLabel: model.fileSizeLabel,
      badge: model.badge,
    );

    final isAlreadyPresent = state.localModels.any((m) => m.path == entry.path);
    if (!isAlreadyPresent) {
      state = state.copyWith(localModels: [...state.localModels, entry]);
    }
  }

  Future<void> deleteModel(LocalModelEntry entry) async {
    if (state.isLoaded(entry.path)) {
      ref.read(chatProvider.notifier).clearConversation();
      final persistService = await ref.read(
        modelPersistenceServiceProvider.future,
      );
      await persistService.clearLoadedModel();
      state = state.copyWith(loadedModelPath: null);
    }

    if (entry.isCustom) {
      final persistService = await ref.read(
        modelPersistenceServiceProvider.future,
      );
      await persistService.removeCustomPath(entry.path);
    } else {
      final downloadService = await ref.read(
        modelDownloadServiceProvider.future,
      );
      final catalogModel = RecommendedModel.catalog.firstWhere(
        (m) => m.id == entry.catalogId,
      );
      await downloadService.deleteModel(catalogModel);
    }

    state = state.copyWith(
      localModels: state.localModels
          .where((m) => m.path != entry.path)
          .toList(),
    );
  }

  void dismissError() => state = state.copyWith(errorMessage: null);
}
