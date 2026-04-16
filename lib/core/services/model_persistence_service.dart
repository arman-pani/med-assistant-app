import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/persisted_model_state.dart';
export '../models/persisted_model_state.dart';

part 'model_persistence_service.g.dart';

class ModelPersistenceService {
  ModelPersistenceService(this._documentsDir);
  final String _documentsDir;

  File get _stateFile => File('$_documentsDir/model_state.json');

  Future<PersistedModelState> load() async {
    try {
      if (!await _stateFile.exists()) {
        return const PersistedModelState();
      }
      final contents = await _stateFile.readAsString();
      final json = jsonDecode(contents) as Map<String, dynamic>;
      return PersistedModelState.fromJson(json);
    } catch (e) {
      debugPrint('Error loading persisted model state: $e');
      return const PersistedModelState();
    }
  }

  Future<void> save(PersistedModelState state) async {
    final tempFile = File('${_stateFile.path}.tmp');
    try {
      final jsonString = jsonEncode(state.toJson());
      await tempFile.writeAsString(jsonString, flush: true);
      await tempFile.rename(_stateFile.path);
    } catch (e) {
      debugPrint('Error saving persisted model state: $e');
      if (await tempFile.exists()) {
        await tempFile.delete();
      }
    }
  }

  Future<void> setLoadedModel(String path, String displayName) async {
    final current = await load();
    await save(
      current.copyWith(loadedModelPath: path, loadedModelName: displayName),
    );
  }

  Future<void> clearLoadedModel() async {
    final current = await load();
    await save(current.copyWith(loadedModelPath: null, loadedModelName: null));
  }

  Future<void> addCustomPath(String path) async {
    final current = await load();
    if (current.customPaths.contains(path)) return;
    await save(current.copyWith(customPaths: [...current.customPaths, path]));
  }

  Future<void> removeCustomPath(String path) async {
    final current = await load();
    await save(
      current.copyWith(
        customPaths: current.customPaths.where((p) => p != path).toList(),
      ),
    );
  }
}

@Riverpod(keepAlive: true)
Future<ModelPersistenceService> modelPersistenceService(Ref ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return ModelPersistenceService(dir.path);
}
