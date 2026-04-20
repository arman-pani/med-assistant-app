// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_catalog_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModelCatalogState _$ModelCatalogStateFromJson(Map<String, dynamic> json) =>
    _ModelCatalogState(
      localModels:
          (json['localModels'] as List<dynamic>?)
              ?.map((e) => LocalModelEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      loadedModelPath: json['loadedModelPath'] as String?,
      loadingModelPath: json['loadingModelPath'] as String?,
      isBootstrapping: json['isBootstrapping'] as bool? ?? true,
      isLoadingModel: json['isLoadingModel'] as bool? ?? false,
      isUserInitiatedLoad: json['isUserInitiatedLoad'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ModelCatalogStateToJson(_ModelCatalogState instance) =>
    <String, dynamic>{
      'localModels': instance.localModels,
      'loadedModelPath': instance.loadedModelPath,
      'loadingModelPath': instance.loadingModelPath,
      'isBootstrapping': instance.isBootstrapping,
      'isLoadingModel': instance.isLoadingModel,
      'isUserInitiatedLoad': instance.isUserInitiatedLoad,
      'errorMessage': instance.errorMessage,
    };
