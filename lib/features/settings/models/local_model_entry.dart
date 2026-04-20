import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_model_entry.freezed.dart';
part 'local_model_entry.g.dart';

@freezed
abstract class LocalModelEntry with _$LocalModelEntry {
  const LocalModelEntry._();

  const factory LocalModelEntry({
    required String path,
    required String displayName,
    String? catalogId,
    String? fileSizeLabel,
    String? badge,
    @Default(false) bool isCustom,
    @Default(false) bool hasProjector,
    String? projectorPath,
  }) = _LocalModelEntry;

  factory LocalModelEntry.fromJson(Map<String, dynamic> json) =>
      _$LocalModelEntryFromJson(json);

  bool get exists => File(path).existsSync();
}
