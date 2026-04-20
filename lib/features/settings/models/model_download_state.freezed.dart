// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_download_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModelDownloadState {

 double get progress; int get receivedBytes; int get totalBytes; bool get isDownloading; bool get isDownloaded; bool get isDownloadingProjector; double get projectorProgress; int get projectorReceivedBytes; String? get error;
/// Create a copy of ModelDownloadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelDownloadStateCopyWith<ModelDownloadState> get copyWith => _$ModelDownloadStateCopyWithImpl<ModelDownloadState>(this as ModelDownloadState, _$identity);

  /// Serializes this ModelDownloadState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelDownloadState&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.receivedBytes, receivedBytes) || other.receivedBytes == receivedBytes)&&(identical(other.totalBytes, totalBytes) || other.totalBytes == totalBytes)&&(identical(other.isDownloading, isDownloading) || other.isDownloading == isDownloading)&&(identical(other.isDownloaded, isDownloaded) || other.isDownloaded == isDownloaded)&&(identical(other.isDownloadingProjector, isDownloadingProjector) || other.isDownloadingProjector == isDownloadingProjector)&&(identical(other.projectorProgress, projectorProgress) || other.projectorProgress == projectorProgress)&&(identical(other.projectorReceivedBytes, projectorReceivedBytes) || other.projectorReceivedBytes == projectorReceivedBytes)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progress,receivedBytes,totalBytes,isDownloading,isDownloaded,isDownloadingProjector,projectorProgress,projectorReceivedBytes,error);

@override
String toString() {
  return 'ModelDownloadState(progress: $progress, receivedBytes: $receivedBytes, totalBytes: $totalBytes, isDownloading: $isDownloading, isDownloaded: $isDownloaded, isDownloadingProjector: $isDownloadingProjector, projectorProgress: $projectorProgress, projectorReceivedBytes: $projectorReceivedBytes, error: $error)';
}


}

/// @nodoc
abstract mixin class $ModelDownloadStateCopyWith<$Res>  {
  factory $ModelDownloadStateCopyWith(ModelDownloadState value, $Res Function(ModelDownloadState) _then) = _$ModelDownloadStateCopyWithImpl;
@useResult
$Res call({
 double progress, int receivedBytes, int totalBytes, bool isDownloading, bool isDownloaded, bool isDownloadingProjector, double projectorProgress, int projectorReceivedBytes, String? error
});




}
/// @nodoc
class _$ModelDownloadStateCopyWithImpl<$Res>
    implements $ModelDownloadStateCopyWith<$Res> {
  _$ModelDownloadStateCopyWithImpl(this._self, this._then);

  final ModelDownloadState _self;
  final $Res Function(ModelDownloadState) _then;

/// Create a copy of ModelDownloadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? progress = null,Object? receivedBytes = null,Object? totalBytes = null,Object? isDownloading = null,Object? isDownloaded = null,Object? isDownloadingProjector = null,Object? projectorProgress = null,Object? projectorReceivedBytes = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,receivedBytes: null == receivedBytes ? _self.receivedBytes : receivedBytes // ignore: cast_nullable_to_non_nullable
as int,totalBytes: null == totalBytes ? _self.totalBytes : totalBytes // ignore: cast_nullable_to_non_nullable
as int,isDownloading: null == isDownloading ? _self.isDownloading : isDownloading // ignore: cast_nullable_to_non_nullable
as bool,isDownloaded: null == isDownloaded ? _self.isDownloaded : isDownloaded // ignore: cast_nullable_to_non_nullable
as bool,isDownloadingProjector: null == isDownloadingProjector ? _self.isDownloadingProjector : isDownloadingProjector // ignore: cast_nullable_to_non_nullable
as bool,projectorProgress: null == projectorProgress ? _self.projectorProgress : projectorProgress // ignore: cast_nullable_to_non_nullable
as double,projectorReceivedBytes: null == projectorReceivedBytes ? _self.projectorReceivedBytes : projectorReceivedBytes // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelDownloadState].
extension ModelDownloadStatePatterns on ModelDownloadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelDownloadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelDownloadState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelDownloadState value)  $default,){
final _that = this;
switch (_that) {
case _ModelDownloadState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelDownloadState value)?  $default,){
final _that = this;
switch (_that) {
case _ModelDownloadState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double progress,  int receivedBytes,  int totalBytes,  bool isDownloading,  bool isDownloaded,  bool isDownloadingProjector,  double projectorProgress,  int projectorReceivedBytes,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelDownloadState() when $default != null:
return $default(_that.progress,_that.receivedBytes,_that.totalBytes,_that.isDownloading,_that.isDownloaded,_that.isDownloadingProjector,_that.projectorProgress,_that.projectorReceivedBytes,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double progress,  int receivedBytes,  int totalBytes,  bool isDownloading,  bool isDownloaded,  bool isDownloadingProjector,  double projectorProgress,  int projectorReceivedBytes,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ModelDownloadState():
return $default(_that.progress,_that.receivedBytes,_that.totalBytes,_that.isDownloading,_that.isDownloaded,_that.isDownloadingProjector,_that.projectorProgress,_that.projectorReceivedBytes,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double progress,  int receivedBytes,  int totalBytes,  bool isDownloading,  bool isDownloaded,  bool isDownloadingProjector,  double projectorProgress,  int projectorReceivedBytes,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ModelDownloadState() when $default != null:
return $default(_that.progress,_that.receivedBytes,_that.totalBytes,_that.isDownloading,_that.isDownloaded,_that.isDownloadingProjector,_that.projectorProgress,_that.projectorReceivedBytes,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelDownloadState extends ModelDownloadState {
  const _ModelDownloadState({this.progress = 0.0, this.receivedBytes = 0, this.totalBytes = 0, this.isDownloading = false, this.isDownloaded = false, this.isDownloadingProjector = false, this.projectorProgress = 0.0, this.projectorReceivedBytes = 0, this.error}): super._();
  factory _ModelDownloadState.fromJson(Map<String, dynamic> json) => _$ModelDownloadStateFromJson(json);

@override@JsonKey() final  double progress;
@override@JsonKey() final  int receivedBytes;
@override@JsonKey() final  int totalBytes;
@override@JsonKey() final  bool isDownloading;
@override@JsonKey() final  bool isDownloaded;
@override@JsonKey() final  bool isDownloadingProjector;
@override@JsonKey() final  double projectorProgress;
@override@JsonKey() final  int projectorReceivedBytes;
@override final  String? error;

/// Create a copy of ModelDownloadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelDownloadStateCopyWith<_ModelDownloadState> get copyWith => __$ModelDownloadStateCopyWithImpl<_ModelDownloadState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelDownloadStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelDownloadState&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.receivedBytes, receivedBytes) || other.receivedBytes == receivedBytes)&&(identical(other.totalBytes, totalBytes) || other.totalBytes == totalBytes)&&(identical(other.isDownloading, isDownloading) || other.isDownloading == isDownloading)&&(identical(other.isDownloaded, isDownloaded) || other.isDownloaded == isDownloaded)&&(identical(other.isDownloadingProjector, isDownloadingProjector) || other.isDownloadingProjector == isDownloadingProjector)&&(identical(other.projectorProgress, projectorProgress) || other.projectorProgress == projectorProgress)&&(identical(other.projectorReceivedBytes, projectorReceivedBytes) || other.projectorReceivedBytes == projectorReceivedBytes)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progress,receivedBytes,totalBytes,isDownloading,isDownloaded,isDownloadingProjector,projectorProgress,projectorReceivedBytes,error);

@override
String toString() {
  return 'ModelDownloadState(progress: $progress, receivedBytes: $receivedBytes, totalBytes: $totalBytes, isDownloading: $isDownloading, isDownloaded: $isDownloaded, isDownloadingProjector: $isDownloadingProjector, projectorProgress: $projectorProgress, projectorReceivedBytes: $projectorReceivedBytes, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ModelDownloadStateCopyWith<$Res> implements $ModelDownloadStateCopyWith<$Res> {
  factory _$ModelDownloadStateCopyWith(_ModelDownloadState value, $Res Function(_ModelDownloadState) _then) = __$ModelDownloadStateCopyWithImpl;
@override @useResult
$Res call({
 double progress, int receivedBytes, int totalBytes, bool isDownloading, bool isDownloaded, bool isDownloadingProjector, double projectorProgress, int projectorReceivedBytes, String? error
});




}
/// @nodoc
class __$ModelDownloadStateCopyWithImpl<$Res>
    implements _$ModelDownloadStateCopyWith<$Res> {
  __$ModelDownloadStateCopyWithImpl(this._self, this._then);

  final _ModelDownloadState _self;
  final $Res Function(_ModelDownloadState) _then;

/// Create a copy of ModelDownloadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? receivedBytes = null,Object? totalBytes = null,Object? isDownloading = null,Object? isDownloaded = null,Object? isDownloadingProjector = null,Object? projectorProgress = null,Object? projectorReceivedBytes = null,Object? error = freezed,}) {
  return _then(_ModelDownloadState(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,receivedBytes: null == receivedBytes ? _self.receivedBytes : receivedBytes // ignore: cast_nullable_to_non_nullable
as int,totalBytes: null == totalBytes ? _self.totalBytes : totalBytes // ignore: cast_nullable_to_non_nullable
as int,isDownloading: null == isDownloading ? _self.isDownloading : isDownloading // ignore: cast_nullable_to_non_nullable
as bool,isDownloaded: null == isDownloaded ? _self.isDownloaded : isDownloaded // ignore: cast_nullable_to_non_nullable
as bool,isDownloadingProjector: null == isDownloadingProjector ? _self.isDownloadingProjector : isDownloadingProjector // ignore: cast_nullable_to_non_nullable
as bool,projectorProgress: null == projectorProgress ? _self.projectorProgress : projectorProgress // ignore: cast_nullable_to_non_nullable
as double,projectorReceivedBytes: null == projectorReceivedBytes ? _self.projectorReceivedBytes : projectorReceivedBytes // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
