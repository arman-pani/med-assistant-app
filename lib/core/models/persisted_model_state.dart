import 'package:freezed_annotation/freezed_annotation.dart';

part 'persisted_model_state.freezed.dart';
part 'persisted_model_state.g.dart';

@freezed
abstract class PersistedModelState with _$PersistedModelState {
  const factory PersistedModelState({
    String? loadedModelPath,
    String? loadedModelName,
    @Default([]) List<String> customPaths,
  }) = _PersistedModelState;

  factory PersistedModelState.fromJson(Map<String, dynamic> json) =>
      _$PersistedModelStateFromJson(json);
}
