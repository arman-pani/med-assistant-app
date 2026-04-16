import 'package:freezed_annotation/freezed_annotation.dart';
import 'local_model_entry.dart';

part 'model_catalog_state.freezed.dart';
part 'model_catalog_state.g.dart';

@freezed
abstract class ModelCatalogState with _$ModelCatalogState {
  const ModelCatalogState._();

  const factory ModelCatalogState({
    @Default([]) List<LocalModelEntry> localModels,
    String? loadedModelPath,
    String? loadingModelPath,
    @Default(false) bool isLoadingModel,
    String? errorMessage,
  }) = _ModelCatalogState;

  factory ModelCatalogState.fromJson(Map<String, dynamic> json) =>
      _$ModelCatalogStateFromJson(json);

  bool isLoaded(String path) => loadedModelPath == path;
}
