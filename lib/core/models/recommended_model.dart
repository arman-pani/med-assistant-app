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
  }) = _RecommendedModel;

  factory RecommendedModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedModelFromJson(json);

  static const List<RecommendedModel> catalog = [
    RecommendedModel(
      id: 'medgemma-4b-q4km',
      displayName: 'MedGemma 4B · Q4_K_M',
      description: 'Best balance of speed and quality. Ideal for most devices.',
      badge: '⭐ Recommended',
      fileSizeLabel: '2.5 GB',
      fileSizeBytes: 2684354560,
      downloadUrl:
          'https://huggingface.co/bartowski/google_medgemma-4b-it-GGUF/resolve/main/google_medgemma-4b-it-Q4_K_M.gguf',
      fileName: 'google_medgemma-4b-it-Q4_K_M.gguf',
      ramRequirement: '4 GB RAM',
    ),
    RecommendedModel(
      id: 'medgemma-4b-q8',
      displayName: 'MedGemma 4B · Q8_0',
      description: 'Highest accuracy 4B quantization. Needs more RAM.',
      badge: 'High Quality',
      fileSizeLabel: '4.7 GB',
      fileSizeBytes: 5046586573,
      downloadUrl:
          'https://huggingface.co/bartowski/google_medgemma-4b-it-GGUF/resolve/main/google_medgemma-4b-it-Q8_0.gguf',
      fileName: 'google_medgemma-4b-it-Q8_0.gguf',
      ramRequirement: '6 GB RAM',
    ),
    RecommendedModel(
      id: 'medgemma-4b-iq4nl',
      displayName: 'MedGemma 4B · IQ4_NL',
      description: 'ARM-optimized 4-bit. Great for mobile and Apple Silicon.',
      badge: 'Mobile Friendly',
      fileSizeLabel: '2.4 GB',
      fileSizeBytes: 2576980378,
      downloadUrl:
          'https://huggingface.co/bartowski/google_medgemma-4b-it-GGUF/resolve/main/google_medgemma-4b-it-IQ4_NL.gguf',
      fileName: 'google_medgemma-4b-it-IQ4_NL.gguf',
      ramRequirement: '4 GB RAM',
    ),
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
    ),
  ];
}
