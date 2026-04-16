// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persisted_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersistedModelState {

 String? get loadedModelPath; String? get loadedModelName; List<String> get customPaths;
/// Create a copy of PersistedModelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersistedModelStateCopyWith<PersistedModelState> get copyWith => _$PersistedModelStateCopyWithImpl<PersistedModelState>(this as PersistedModelState, _$identity);

  /// Serializes this PersistedModelState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersistedModelState&&(identical(other.loadedModelPath, loadedModelPath) || other.loadedModelPath == loadedModelPath)&&(identical(other.loadedModelName, loadedModelName) || other.loadedModelName == loadedModelName)&&const DeepCollectionEquality().equals(other.customPaths, customPaths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loadedModelPath,loadedModelName,const DeepCollectionEquality().hash(customPaths));

@override
String toString() {
  return 'PersistedModelState(loadedModelPath: $loadedModelPath, loadedModelName: $loadedModelName, customPaths: $customPaths)';
}


}

/// @nodoc
abstract mixin class $PersistedModelStateCopyWith<$Res>  {
  factory $PersistedModelStateCopyWith(PersistedModelState value, $Res Function(PersistedModelState) _then) = _$PersistedModelStateCopyWithImpl;
@useResult
$Res call({
 String? loadedModelPath, String? loadedModelName, List<String> customPaths
});




}
/// @nodoc
class _$PersistedModelStateCopyWithImpl<$Res>
    implements $PersistedModelStateCopyWith<$Res> {
  _$PersistedModelStateCopyWithImpl(this._self, this._then);

  final PersistedModelState _self;
  final $Res Function(PersistedModelState) _then;

/// Create a copy of PersistedModelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadedModelPath = freezed,Object? loadedModelName = freezed,Object? customPaths = null,}) {
  return _then(_self.copyWith(
loadedModelPath: freezed == loadedModelPath ? _self.loadedModelPath : loadedModelPath // ignore: cast_nullable_to_non_nullable
as String?,loadedModelName: freezed == loadedModelName ? _self.loadedModelName : loadedModelName // ignore: cast_nullable_to_non_nullable
as String?,customPaths: null == customPaths ? _self.customPaths : customPaths // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PersistedModelState].
extension PersistedModelStatePatterns on PersistedModelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersistedModelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersistedModelState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersistedModelState value)  $default,){
final _that = this;
switch (_that) {
case _PersistedModelState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersistedModelState value)?  $default,){
final _that = this;
switch (_that) {
case _PersistedModelState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? loadedModelPath,  String? loadedModelName,  List<String> customPaths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersistedModelState() when $default != null:
return $default(_that.loadedModelPath,_that.loadedModelName,_that.customPaths);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? loadedModelPath,  String? loadedModelName,  List<String> customPaths)  $default,) {final _that = this;
switch (_that) {
case _PersistedModelState():
return $default(_that.loadedModelPath,_that.loadedModelName,_that.customPaths);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? loadedModelPath,  String? loadedModelName,  List<String> customPaths)?  $default,) {final _that = this;
switch (_that) {
case _PersistedModelState() when $default != null:
return $default(_that.loadedModelPath,_that.loadedModelName,_that.customPaths);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersistedModelState implements PersistedModelState {
  const _PersistedModelState({this.loadedModelPath, this.loadedModelName, final  List<String> customPaths = const []}): _customPaths = customPaths;
  factory _PersistedModelState.fromJson(Map<String, dynamic> json) => _$PersistedModelStateFromJson(json);

@override final  String? loadedModelPath;
@override final  String? loadedModelName;
 final  List<String> _customPaths;
@override@JsonKey() List<String> get customPaths {
  if (_customPaths is EqualUnmodifiableListView) return _customPaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customPaths);
}


/// Create a copy of PersistedModelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersistedModelStateCopyWith<_PersistedModelState> get copyWith => __$PersistedModelStateCopyWithImpl<_PersistedModelState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersistedModelStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersistedModelState&&(identical(other.loadedModelPath, loadedModelPath) || other.loadedModelPath == loadedModelPath)&&(identical(other.loadedModelName, loadedModelName) || other.loadedModelName == loadedModelName)&&const DeepCollectionEquality().equals(other._customPaths, _customPaths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loadedModelPath,loadedModelName,const DeepCollectionEquality().hash(_customPaths));

@override
String toString() {
  return 'PersistedModelState(loadedModelPath: $loadedModelPath, loadedModelName: $loadedModelName, customPaths: $customPaths)';
}


}

/// @nodoc
abstract mixin class _$PersistedModelStateCopyWith<$Res> implements $PersistedModelStateCopyWith<$Res> {
  factory _$PersistedModelStateCopyWith(_PersistedModelState value, $Res Function(_PersistedModelState) _then) = __$PersistedModelStateCopyWithImpl;
@override @useResult
$Res call({
 String? loadedModelPath, String? loadedModelName, List<String> customPaths
});




}
/// @nodoc
class __$PersistedModelStateCopyWithImpl<$Res>
    implements _$PersistedModelStateCopyWith<$Res> {
  __$PersistedModelStateCopyWithImpl(this._self, this._then);

  final _PersistedModelState _self;
  final $Res Function(_PersistedModelState) _then;

/// Create a copy of PersistedModelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadedModelPath = freezed,Object? loadedModelName = freezed,Object? customPaths = null,}) {
  return _then(_PersistedModelState(
loadedModelPath: freezed == loadedModelPath ? _self.loadedModelPath : loadedModelPath // ignore: cast_nullable_to_non_nullable
as String?,loadedModelName: freezed == loadedModelName ? _self.loadedModelName : loadedModelName // ignore: cast_nullable_to_non_nullable
as String?,customPaths: null == customPaths ? _self._customPaths : customPaths // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
