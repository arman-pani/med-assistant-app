import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommended_model.freezed.dart';
part 'recommended_model.g.dart';

@freezed
abstract class RecommendedModel with _$RecommendedModel {
  const factory RecommendedModel({
    required String id,
    required String displayName,
    required String description,
    required String badge,
    required String fileSizeLabel,
    required int fileSizeBytes,
    required String downloadUrl,
    required String fileName,
    required String ramRequirement,
    String? projectorDownloadUrl,
    String? projectorFileName,
    String? projectorSizeLabel,
    @Default(0) int projectorSizeBytes,
  }) = _RecommendedModel;

  factory RecommendedModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedModelFromJson(json);

  static const List<RecommendedModel> catalog = [
    RecommendedModel(
      id: 'medgemma-4b-q4ks',
      displayName: 'MedGemma 4B · Q4_K_S',
      description:
          'Smallest footprint 4B. For very memory-constrained devices.',
      badge: 'Lightweight',
      fileSizeLabel: '2.3 GB',
      fileSizeBytes: 2469606195,
      downloadUrl:
          'https://huggingface.co/bartowski/google_medgemma-4b-it-GGUF/resolve/main/google_medgemma-4b-it-Q4_K_S.gguf',
      fileName: 'google_medgemma-4b-it-Q4_K_S.gguf',
      ramRequirement: '3.5 GB RAM',
      projectorDownloadUrl:
          'https://huggingface.co/bartowski/google_medgemma-4b-it-GGUF/resolve/main/mmproj-google_medgemma-4b-it-f16.gguf',
      projectorFileName: 'mmproj-google_medgemma-4b-it-f16.gguf',
      projectorSizeLabel: '624 MB',
      projectorSizeBytes: 654311424,
    ),
    RecommendedModel(
      id: 'medgemma-4b-iq2xxs',
      displayName: 'MedGemma 4B · IQ2_XXS (Unsloth)',
      description:
          'Ultra-small quantization for maximum speed and lowest RAM usage.',
      badge: 'Ultra Low',
      fileSizeLabel: '1.25 GB',
      fileSizeBytes: 1344119360,
      downloadUrl:
          'https://huggingface.co/unsloth/medgemma-4b-it-GGUF/resolve/main/medgemma-4b-it-UD-IQ2_XXS.gguf',
      fileName: 'medgemma-4b-it-UD-IQ2_XXS.gguf',
      ramRequirement: '2 GB RAM',
      projectorDownloadUrl:
          'https://huggingface.co/bartowski/google_medgemma-4b-it-GGUF/resolve/main/mmproj-google_medgemma-4b-it-f16.gguf',
      projectorFileName: 'mmproj-google_medgemma-4b-it-f16.gguf',
      projectorSizeLabel: '624 MB',
      projectorSizeBytes: 654311424,
    ),
  ];
}
