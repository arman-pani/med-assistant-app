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
  ChatState build() => ChatState(
    isModelLoaded: ModelManager().isLoaded,
    isModelLoading: false,
    visionSupported: ModelManager().isVisionReady,
  );

  Future<void> loadModel(String path) async {
    await loadModelPath(path);
  }

  Future<void> loadModelPath(
    String path, {
    bool completeOnSuccess = true,
    bool expectProjector = false,
  }) async {
    state = state.copyWith(
      isModelLoaded: false,
      isModelLoading: true,
      isProjectorLoading: expectProjector,
      visionSupported: false,
      errorMessage: null,
      pendingImagePath: null,
    );
    try {
      await ModelManager().loadModel(path);
      if (completeOnSuccess) {
        markModelReady(visionReady: ModelManager().isVisionReady);
      }
    } catch (e) {
      failModelLoad(
        'Could not load model. Ensure the path is correct and the file is a '
        'valid GGUF model.\n${e.toString()}',
      );
      rethrow;
    }
  }

  void attachImage(String imagePath) {
    state = state.copyWith(pendingImagePath: imagePath, errorMessage: null);
  }

  void clearAttachedImage() {
    state = state.copyWith(pendingImagePath: null);
  }

  void setVisionSupported(bool supported) {
    state = state.copyWith(visionSupported: supported);
  }

  Future<void> refreshVisionSupport() async {
    final vision = ModelManager().isVisionReady;
    state = state.copyWith(visionSupported: vision);
  }

  void markProjectorLoading(bool isLoading) {
    state = state.copyWith(
      isModelLoading: isLoading,
      isProjectorLoading: isLoading,
      visionSupported: isLoading ? false : state.visionSupported,
    );
  }

  void markModelReady({required bool visionReady}) {
    state = state.copyWith(
      isModelLoaded: true,
      isModelLoading: false,
      isProjectorLoading: false,
      visionSupported: visionReady,
      errorMessage: null,
    );
  }

  void failModelLoad(String message) {
    state = state.copyWith(
      isModelLoaded: false,
      isModelLoading: false,
      isProjectorLoading: false,
      visionSupported: false,
      errorMessage: message,
      pendingImagePath: null,
    );
  }

  void setError(String message) {
    state = state.copyWith(errorMessage: message);
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty && state.pendingImagePath == null) return;
    if (state.isGenerating) return;

    final imagePath = state.pendingImagePath;
    final hasImage = imagePath != null;

    final userMsg = ChatMessage(
      text: text.trim(),
      isUser: true,
      timestamp: DateTime.now(),
      imagePath: imagePath,
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
      pendingImagePath: null, // clear staged image immediately after send
    );

    final buffer = StringBuffer();

    final Stream<String> stream = hasImage
        ? ModelManager().sendMessageWithImage(text.trim(), imagePath)
        : ModelManager().sendMessage(text.trim());

    _generationSub = stream.listen(
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
        updated[updated.length - 1] = updated.last.copyWith(isStreaming: false);
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
    state = state.copyWith(
      messages: [],
      isGenerating: false,
      errorMessage: null,
    );
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
