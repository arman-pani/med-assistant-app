import 'package:flutter/foundation.dart';
import 'package:llamadart/llamadart.dart';

class ModelLoadException implements Exception {
  final String message;
  ModelLoadException(this.message);

  @override
  String toString() => 'ModelLoadException: $message';
}

class ModelManager {
  static final ModelManager _instance = ModelManager._internal();

  static ModelManager get instance => _instance;

  factory ModelManager() => _instance;

  ModelManager._internal();

  /// Configures the detailed logging for llamadart.
  static void initLogging() {
    LlamaLogger.instance.setLevel(LlamaLogLevel.debug);
    LlamaLogger.instance.setHandler((record) {
      debugPrint(record.toString());
    });
  }

  late final LlamaEngine _engine = LlamaEngine(LlamaBackend());
  ChatSession? _session;
  bool _isLoaded = false;
  bool _projectorLoaded = false;

  bool get isLoaded => _isLoaded;
  bool get isProjectorLoaded => _projectorLoaded;
  bool get isVisionReady => _isLoaded && _projectorLoaded;

  Future<void> loadModel(String modelPath) async {
    _session = null;
    _isLoaded = false;
    _projectorLoaded = false;

    try {
      await _engine.loadModel(modelPath);
      _session = ChatSession(_engine);
      _isLoaded = true;
    } catch (e) {
      _isLoaded = false;
      throw ModelLoadException('Failed to load model: ${e.toString()}');
    }
  }

  Future<void> loadProjector(String projectorPath) async {
    if (!_isLoaded) {
      throw ModelLoadException(
        'Cannot load vision projector before the base model is loaded.',
      );
    }

    try {
      await _engine.loadMultimodalProjector(projectorPath);
      _projectorLoaded = true;
    } catch (e) {
      _projectorLoaded = false;
      throw ModelLoadException('Failed to load projector: ${e.toString()}');
    }
  }

  Stream<String> sendMessage(String userMessage) async* {
    if (_session == null || !_isLoaded) {
      throw ModelLoadException('Model not loaded. Call loadModel() first.');
    }

    final stream = _session!.create([LlamaTextContent(userMessage)]);

    await for (final chunk in stream) {
      final content = chunk.choices.first.delta.content;
      if (content != null && content.isNotEmpty) {
        yield content;
      }
    }
  }

  Stream<String> sendMessageWithImage(String userText, String imagePath) {
    if (!_projectorLoaded) {
      throw Exception(
        'Vision projector not loaded. Please load the mmproj file first.',
      );
    }

    // Uses engine.create directly (not ChatSession) so we can pass
    // a multimodal LlamaChatMessage with both image and text content.
    // We still manually maintain history via session for text turns,
    // but for image turns use engine.create with full message history.
    final message = LlamaChatMessage.withContent(
      role: LlamaChatRole.user,
      content: [
        LlamaImageContent(path: imagePath),
        LlamaTextContent(
          userText.isNotEmpty
              ? userText
              : 'Describe what you see in this medical image. '
                    'Note any clinically relevant findings.',
        ),
      ],
    );

    return _engine
        .create([message])
        .map((chunk) => chunk.choices.first.delta.content ?? '')
        .where((text) => text.isNotEmpty);
  }

  Future<bool> checkVisionSupport() async => _engine.supportsVision;

  void resetConversation() {
    _session?.reset();
  }

  Future<void> dispose() async {
    await _engine.dispose();
    _session = null;
    _isLoaded = false;
    _projectorLoaded = false;
  }
}
