import 'package:llamadart/llamadart.dart';

class ModelLoadException implements Exception {
  final String message;
  ModelLoadException(this.message);

  @override
  String toString() => 'ModelLoadException: $message';
}

class ModelManager {
  static final ModelManager _instance = ModelManager._internal();

  factory ModelManager() => _instance;

  ModelManager._internal();

  late final LlamaEngine _engine = LlamaEngine(LlamaBackend());
  ChatSession? _session;
  bool _isLoaded = false;

  //   static const String _systemPrompt = '''
  // You are MedGemma, a helpful medical AI assistant. You provide clear, accurate,
  // evidence-based health information. Always recommend consulting a qualified
  // healthcare professional for personal medical advice. Never diagnose conditions
  // definitively. Be empathetic and thorough.
  // ''';

  bool get isLoaded => _isLoaded;

  Future<void> loadModel(String modelPath) async {
    try {
      await _engine.loadModel(modelPath);
      _session = ChatSession(_engine);
      _isLoaded = true;
    } catch (e) {
      _isLoaded = false;
      throw ModelLoadException('Failed to load model: ${e.toString()}');
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

  void resetConversation() {
    if (_session != null) {
      _session!.reset();
    }
  }

  Future<void> dispose() async {
    await _engine.dispose();
    _session = null;
    _isLoaded = false;
  }
}
