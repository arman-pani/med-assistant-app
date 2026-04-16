import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/model_manager.dart';
import '../models/chat_message.dart';
import '../models/chat_state.dart';

export '../models/chat_message.dart';
export '../models/chat_state.dart';

part 'chat_provider.g.dart';

@Riverpod(keepAlive: true)
class ChatNotifier extends _$ChatNotifier {
  StreamSubscription<String>? _generationSub;

  @override
  ChatState build() => ChatState(isModelLoaded: ModelManager().isLoaded);

  Future<void> loadModel(String path) async {
    await loadModelPath(path);
  }

  Future<void> loadModelPath(String path) async {
    state = state.copyWith(isGenerating: true, errorMessage: null);
    try {
      await ModelManager().loadModel(path);
      state = state.copyWith(isModelLoaded: true, isGenerating: false);
    } catch (e) {
      state = state.copyWith(
        isGenerating: false,
        errorMessage:
            'Could not load model. Ensure the path is correct '
            'and the file is a valid GGUF model.\n${e.toString()}',
      );
    }
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty || state.isGenerating) return;

    final userMsg = ChatMessage(
      text: text.trim(),
      isUser: true,
      timestamp: DateTime.now(),
    );
    final assistantPlaceholder = ChatMessage(
      text: '',
      isUser: false,
      timestamp: DateTime.now(),
      isStreaming: true,
    );

    state = state.copyWith(
      messages: [...state.messages, userMsg, assistantPlaceholder],
      isGenerating: true,
      errorMessage: null,
    );

    final buffer = StringBuffer();

    _generationSub = ModelManager()
        .sendMessage(text.trim())
        .listen(
          (chunk) {
            buffer.write(chunk);
            final updated = List<ChatMessage>.from(state.messages);
            updated[updated.length - 1] = updated.last.copyWith(
              text: buffer.toString(),
            );
            state = state.copyWith(messages: updated);
          },
          onDone: () {
            final updated = List<ChatMessage>.from(state.messages);
            updated[updated.length - 1] = updated.last.copyWith(
              isStreaming: false,
            );
            state = state.copyWith(messages: updated, isGenerating: false);
          },
          onError: (e) {
            final updated = List<ChatMessage>.from(state.messages);
            updated[updated.length - 1] = updated.last.copyWith(
              text: '[Generation failed. Please try again.]',
              isStreaming: false,
            );
            state = state.copyWith(
              messages: updated,
              isGenerating: false,
              errorMessage: e.toString(),
            );
          },
          cancelOnError: true,
        );
  }

  void clearConversation() {
    _generationSub?.cancel();
    ModelManager().resetConversation();
    state = state.copyWith(messages: [], isGenerating: false, errorMessage: null);
  }

  void dismissError() {
    state = state.copyWith(errorMessage: null);
  }

  void stopGeneration() {
    _generationSub?.cancel();
    _generationSub = null;
    final updated = List<ChatMessage>.from(state.messages);
    if (updated.isNotEmpty && updated.last.isStreaming) {
      updated[updated.length - 1] = updated.last.copyWith(isStreaming: false);
    }
    state = state.copyWith(messages: updated, isGenerating: false);
  }
}
