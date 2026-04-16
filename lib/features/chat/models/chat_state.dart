import 'package:freezed_annotation/freezed_annotation.dart';
import 'chat_message.dart';

part 'chat_state.freezed.dart';
part 'chat_state.g.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isModelLoaded,
    @Default(false) bool isGenerating,
    String? errorMessage,
  }) = _ChatState;

  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);
}
