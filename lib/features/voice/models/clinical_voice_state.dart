import 'package:freezed_annotation/freezed_annotation.dart';
import 'voice_session_status.dart';

part 'clinical_voice_state.freezed.dart';

@freezed
abstract class ClinicalVoiceState with _$ClinicalVoiceState {
  const factory ClinicalVoiceState({
    @Default(VoiceSessionStatus.idle) VoiceSessionStatus status,
    @Default('') String liveTranscript,
    @Default('') String finalTranscript,
    @Default('') String prescriptionMarkdown,
    @Default(false) bool isGenerating,
    String? errorMessage,
    @Default('') String patientName,
    @Default('') String doctorName,
    @Default('') String clinicName,
  }) = _ClinicalVoiceState;
}
