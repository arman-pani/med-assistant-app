// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatState _$ChatStateFromJson(Map<String, dynamic> json) => _ChatState(
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isModelLoaded: json['isModelLoaded'] as bool? ?? false,
  isModelLoading: json['isModelLoading'] as bool? ?? false,
  isProjectorLoading: json['isProjectorLoading'] as bool? ?? false,
  isGenerating: json['isGenerating'] as bool? ?? false,
  errorMessage: json['errorMessage'] as String?,
  pendingImagePath: json['pendingImagePath'] as String?,
  visionSupported: json['visionSupported'] as bool? ?? false,
);

Map<String, dynamic> _$ChatStateToJson(_ChatState instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'isModelLoaded': instance.isModelLoaded,
      'isModelLoading': instance.isModelLoading,
      'isProjectorLoading': instance.isProjectorLoading,
      'isGenerating': instance.isGenerating,
      'errorMessage': instance.errorMessage,
      'pendingImagePath': instance.pendingImagePath,
      'visionSupported': instance.visionSupported,
    };
