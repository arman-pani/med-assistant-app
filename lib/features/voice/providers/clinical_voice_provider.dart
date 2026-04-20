import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/voice_service.dart';
import '../../../core/services/model_manager.dart';
import '../models/clinical_voice_state.dart';
import '../models/voice_session_status.dart';

part 'clinical_voice_provider.g.dart';

@riverpod
class ClinicalVoiceNotifier extends _$ClinicalVoiceNotifier {
  @override
  ClinicalVoiceState build() => const ClinicalVoiceState();

  void setPatientContext({
    required String patientName,
    required String doctorName,
    required String clinicName,
  }) {
    state = state.copyWith(
      patientName: patientName,
      doctorName: doctorName,
      clinicName: clinicName,
    );
  }

  Future<void> startListening() async {
    final voice = await ref.read(voiceServiceProvider.future);
    if (!voice.isAvailable) {
      state = state.copyWith(
        status: VoiceSessionStatus.error,
        errorMessage: 'Microphone not available or permission denied.',
      );
      return;
    }

    state = state.copyWith(
      status: VoiceSessionStatus.listening,
      liveTranscript: '',
      finalTranscript: '',
      prescriptionMarkdown: '',
      errorMessage: null,
    );

    await voice.startListening(
      onResult: (words, isFinal) {
        state = state.copyWith(liveTranscript: words);
        if (isFinal) {
          state = state.copyWith(finalTranscript: words);
        }
      },
      onSoundLevelChange: () {}, // could drive a mic animation if desired
    );
  }

  Future<void> stopAndProcess() async {
    final voice = await ref.read(voiceServiceProvider.future);
    await voice.stopListening();

    final transcript = state.liveTranscript.trim().isNotEmpty
        ? state.liveTranscript.trim()
        : state.finalTranscript.trim();

    if (transcript.isEmpty) {
      state = state.copyWith(
        status: VoiceSessionStatus.idle,
        errorMessage: 'No speech detected. Please try again.',
      );
      return;
    }

    state = state.copyWith(
      status: VoiceSessionStatus.processing,
      finalTranscript: transcript,
      isGenerating: true,
    );

    final prompt =
        '''
You are a medical assistant helping a doctor create a clinical prescription.
The doctor has just dictated the following clinical notes during a patient consultation:

---
$transcript
---

Based on these notes, generate a structured medical prescription in Markdown format 
with exactly these sections (include all sections even if some have no data):

# Prescription

## Patient Information
- Name: ${state.patientName.isNotEmpty ? state.patientName : '[extract from notes or leave blank]'}
- Age / Gender: [extract if mentioned]
- Date: ${DateTime.now().toLocal().toString().substring(0, 10)}

## Chief Complaint
[1-2 sentences from the notes]

## Diagnosis / Clinical Impression
[extracted from notes]

## Medications Prescribed
| Drug | Dose | Route | Frequency | Duration |
|------|------|-------|-----------|----------|
[fill rows from notes]

## Instructions to Patient
[any specific instructions mentioned]

## Follow-up
[follow-up date or instructions if mentioned]

## Doctor's Notes
[any additional clinical observations]

---
Doctor: ${state.doctorName.isNotEmpty ? state.doctorName : '[Doctor Name]'}
Clinic: ${state.clinicName.isNotEmpty ? state.clinicName : '[Clinic Name]'}
''';

    final buffer = StringBuffer();
    try {
      final stream = ModelManager().sendMessage(prompt);
      await for (final chunk in stream) {
        buffer.write(chunk);
        state = state.copyWith(prescriptionMarkdown: buffer.toString());
      }
      state = state.copyWith(
        status: VoiceSessionStatus.done,
        isGenerating: false,
        prescriptionMarkdown: buffer.toString(),
      );
    } catch (e) {
      state = state.copyWith(
        status: VoiceSessionStatus.error,
        isGenerating: false,
        errorMessage: 'Generation failed: ${e.toString()}',
      );
    }
  }

  Future<void> cancelListening() async {
    final voice = await ref.read(voiceServiceProvider.future);
    await voice.cancelListening();
    state = state.copyWith(status: VoiceSessionStatus.idle, liveTranscript: '');
  }

  void reset() {
    state = const ClinicalVoiceState();
  }

  void updatePrescription(String newText) {
    // Allow manual editing of the generated prescription
    state = state.copyWith(prescriptionMarkdown: newText);
  }

  void dismissError() => state = state.copyWith(errorMessage: null);
}
