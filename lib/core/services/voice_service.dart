import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_service.g.dart';

class VoiceService {
  final SpeechToText _stt = SpeechToText();
  bool _initialized = false;
  bool get isAvailable => _initialized;

  Future<bool> initialize() async {
    _initialized = await _stt.initialize(
      onError: (error) => debugPrint('STT error: $error'),
      debugLogging: false,
    );
    return _initialized;
  }

  bool get isListening => _stt.isListening;

  Future<void> startListening({
    required void Function(String words, bool isFinal) onResult,
    required void Function() onSoundLevelChange,
    Duration listenFor = const Duration(minutes: 5),
    Duration pauseFor = const Duration(seconds: 4),
  }) async {
    if (!_initialized || _stt.isListening) return;
    await _stt.listen(
      onResult: (SpeechRecognitionResult result) {
        onResult(result.recognizedWords, result.finalResult);
      },
      listenFor: listenFor,
      pauseFor: pauseFor,
      partialResults: true, // stream partial results as user speaks
      listenMode: ListenMode.dictation, // best for long-form medical notes
      cancelOnError: false,
    );
  }

  Future<void> stopListening() async {
    await _stt.stop();
  }

  Future<void> cancelListening() async {
    await _stt.cancel();
  }
}

@Riverpod(keepAlive: true)
Future<VoiceService> voiceService(Ref ref) async {
  final service = VoiceService();
  await service.initialize();
  return service;
}
