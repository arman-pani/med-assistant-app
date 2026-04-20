// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatState {

 List<ChatMessage> get messages; bool get isModelLoaded; bool get isModelLoading; bool get isProjectorLoading; bool get isGenerating; String? get errorMessage; String? get pendingImagePath; bool get visionSupported;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);

  /// Serializes this ChatState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isModelLoaded, isModelLoaded) || other.isModelLoaded == isModelLoaded)&&(identical(other.isModelLoading, isModelLoading) || other.isModelLoading == isModelLoading)&&(identical(other.isProjectorLoading, isProjectorLoading) || other.isProjectorLoading == isProjectorLoading)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.pendingImagePath, pendingImagePath) || other.pendingImagePath == pendingImagePath)&&(identical(other.visionSupported, visionSupported) || other.visionSupported == visionSupported));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),isModelLoaded,isModelLoading,isProjectorLoading,isGenerating,errorMessage,pendingImagePath,visionSupported);

@override
String toString() {
  return 'ChatState(messages: $messages, isModelLoaded: $isModelLoaded, isModelLoading: $isModelLoading, isProjectorLoading: $isProjectorLoading, isGenerating: $isGenerating, errorMessage: $errorMessage, pendingImagePath: $pendingImagePath, visionSupported: $visionSupported)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 List<ChatMessage> messages, bool isModelLoaded, bool isModelLoading, bool isProjectorLoading, bool isGenerating, String? errorMessage, String? pendingImagePath, bool visionSupported
});




}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? isModelLoaded = null,Object? isModelLoading = null,Object? isProjectorLoading = null,Object? isGenerating = null,Object? errorMessage = freezed,Object? pendingImagePath = freezed,Object? visionSupported = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,isModelLoaded: null == isModelLoaded ? _self.isModelLoaded : isModelLoaded // ignore: cast_nullable_to_non_nullable
as bool,isModelLoading: null == isModelLoading ? _self.isModelLoading : isModelLoading // ignore: cast_nullable_to_non_nullable
as bool,isProjectorLoading: null == isProjectorLoading ? _self.isProjectorLoading : isProjectorLoading // ignore: cast_nullable_to_non_nullable
as bool,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,pendingImagePath: freezed == pendingImagePath ? _self.pendingImagePath : pendingImagePath // ignore: cast_nullable_to_non_nullable
as String?,visionSupported: null == visionSupported ? _self.visionSupported : visionSupported // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatMessage> messages,  bool isModelLoaded,  bool isModelLoading,  bool isProjectorLoading,  bool isGenerating,  String? errorMessage,  String? pendingImagePath,  bool visionSupported)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.messages,_that.isModelLoaded,_that.isModelLoading,_that.isProjectorLoading,_that.isGenerating,_that.errorMessage,_that.pendingImagePath,_that.visionSupported);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatMessage> messages,  bool isModelLoaded,  bool isModelLoading,  bool isProjectorLoading,  bool isGenerating,  String? errorMessage,  String? pendingImagePath,  bool visionSupported)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.messages,_that.isModelLoaded,_that.isModelLoading,_that.isProjectorLoading,_that.isGenerating,_that.errorMessage,_that.pendingImagePath,_that.visionSupported);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatMessage> messages,  bool isModelLoaded,  bool isModelLoading,  bool isProjectorLoading,  bool isGenerating,  String? errorMessage,  String? pendingImagePath,  bool visionSupported)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.messages,_that.isModelLoaded,_that.isModelLoading,_that.isProjectorLoading,_that.isGenerating,_that.errorMessage,_that.pendingImagePath,_that.visionSupported);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatState implements ChatState {
  const _ChatState({final  List<ChatMessage> messages = const [], this.isModelLoaded = false, this.isModelLoading = false, this.isProjectorLoading = false, this.isGenerating = false, this.errorMessage, this.pendingImagePath, this.visionSupported = false}): _messages = messages;
  factory _ChatState.fromJson(Map<String, dynamic> json) => _$ChatStateFromJson(json);

 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  bool isModelLoaded;
@override@JsonKey() final  bool isModelLoading;
@override@JsonKey() final  bool isProjectorLoading;
@override@JsonKey() final  bool isGenerating;
@override final  String? errorMessage;
@override final  String? pendingImagePath;
@override@JsonKey() final  bool visionSupported;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isModelLoaded, isModelLoaded) || other.isModelLoaded == isModelLoaded)&&(identical(other.isModelLoading, isModelLoading) || other.isModelLoading == isModelLoading)&&(identical(other.isProjectorLoading, isProjectorLoading) || other.isProjectorLoading == isProjectorLoading)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.pendingImagePath, pendingImagePath) || other.pendingImagePath == pendingImagePath)&&(identical(other.visionSupported, visionSupported) || other.visionSupported == visionSupported));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),isModelLoaded,isModelLoading,isProjectorLoading,isGenerating,errorMessage,pendingImagePath,visionSupported);

@override
String toString() {
  return 'ChatState(messages: $messages, isModelLoaded: $isModelLoaded, isModelLoading: $isModelLoading, isProjectorLoading: $isProjectorLoading, isGenerating: $isGenerating, errorMessage: $errorMessage, pendingImagePath: $pendingImagePath, visionSupported: $visionSupported)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 List<ChatMessage> messages, bool isModelLoaded, bool isModelLoading, bool isProjectorLoading, bool isGenerating, String? errorMessage, String? pendingImagePath, bool visionSupported
});




}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? isModelLoaded = null,Object? isModelLoading = null,Object? isProjectorLoading = null,Object? isGenerating = null,Object? errorMessage = freezed,Object? pendingImagePath = freezed,Object? visionSupported = null,}) {
  return _then(_ChatState(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,isModelLoaded: null == isModelLoaded ? _self.isModelLoaded : isModelLoaded // ignore: cast_nullable_to_non_nullable
as bool,isModelLoading: null == isModelLoading ? _self.isModelLoading : isModelLoading // ignore: cast_nullable_to_non_nullable
as bool,isProjectorLoading: null == isProjectorLoading ? _self.isProjectorLoading : isProjectorLoading // ignore: cast_nullable_to_non_nullable
as bool,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,pendingImagePath: freezed == pendingImagePath ? _self.pendingImagePath : pendingImagePath // ignore: cast_nullable_to_non_nullable
as String?,visionSupported: null == visionSupported ? _self.visionSupported : visionSupported // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
