import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/persisted_model_state.dart';
export '../models/persisted_model_state.dart';

part 'model_persistence_service.g.dart';

class ModelPersistenceService {
  late final Box _box = Hive.box('model_state');

  Future<PersistedModelState> load() async {
    try {
      final loadedModelPath = _box.get('loadedModelPath') as String?;
      final loadedModelName = _box.get('loadedModelName') as String?;
      final dynamic pathsDynamic = _box.get('customPaths', defaultValue: <String>[]);
      final customPaths = (pathsDynamic as List).map((e) => e.toString()).toList();
      
      return PersistedModelState(
        loadedModelPath: loadedModelPath,
        loadedModelName: loadedModelName,
        customPaths: customPaths,
      );
    } catch (e) {
      debugPrint('Error loading persisted model state from Hive: $e');
      return const PersistedModelState();
    }
  }

  Future<void> save(PersistedModelState state) async {
    try {
      await _box.put('loadedModelPath', state.loadedModelPath);
      await _box.put('loadedModelName', state.loadedModelName);
      await _box.put('customPaths', state.customPaths);
    } catch (e) {
      debugPrint('Error saving persisted model state to Hive: $e');
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
  return ModelPersistenceService();
}
