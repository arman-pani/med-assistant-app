// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persisted_model_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersistedModelState _$PersistedModelStateFromJson(Map<String, dynamic> json) =>
    _PersistedModelState(
      loadedModelPath: json['loadedModelPath'] as String?,
      loadedModelName: json['loadedModelName'] as String?,
      customPaths:
          (json['customPaths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PersistedModelStateToJson(
  _PersistedModelState instance,
) => <String, dynamic>{
  'loadedModelPath': instance.loadedModelPath,
  'loadedModelName': instance.loadedModelName,
  'customPaths': instance.customPaths,
};
