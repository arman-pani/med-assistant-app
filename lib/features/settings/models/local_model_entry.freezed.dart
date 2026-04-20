// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_model_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalModelEntry {

 String get path; String get displayName; String? get catalogId; String? get fileSizeLabel; String? get badge; bool get isCustom; bool get hasProjector; String? get projectorPath;
/// Create a copy of LocalModelEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalModelEntryCopyWith<LocalModelEntry> get copyWith => _$LocalModelEntryCopyWithImpl<LocalModelEntry>(this as LocalModelEntry, _$identity);

  /// Serializes this LocalModelEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalModelEntry&&(identical(other.path, path) || other.path == path)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.catalogId, catalogId) || other.catalogId == catalogId)&&(identical(other.fileSizeLabel, fileSizeLabel) || other.fileSizeLabel == fileSizeLabel)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.hasProjector, hasProjector) || other.hasProjector == hasProjector)&&(identical(other.projectorPath, projectorPath) || other.projectorPath == projectorPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,displayName,catalogId,fileSizeLabel,badge,isCustom,hasProjector,projectorPath);

@override
String toString() {
  return 'LocalModelEntry(path: $path, displayName: $displayName, catalogId: $catalogId, fileSizeLabel: $fileSizeLabel, badge: $badge, isCustom: $isCustom, hasProjector: $hasProjector, projectorPath: $projectorPath)';
}


}

/// @nodoc
abstract mixin class $LocalModelEntryCopyWith<$Res>  {
  factory $LocalModelEntryCopyWith(LocalModelEntry value, $Res Function(LocalModelEntry) _then) = _$LocalModelEntryCopyWithImpl;
@useResult
$Res call({
 String path, String displayName, String? catalogId, String? fileSizeLabel, String? badge, bool isCustom, bool hasProjector, String? projectorPath
});




}
/// @nodoc
class _$LocalModelEntryCopyWithImpl<$Res>
    implements $LocalModelEntryCopyWith<$Res> {
  _$LocalModelEntryCopyWithImpl(this._self, this._then);

  final LocalModelEntry _self;
  final $Res Function(LocalModelEntry) _then;

/// Create a copy of LocalModelEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? displayName = null,Object? catalogId = freezed,Object? fileSizeLabel = freezed,Object? badge = freezed,Object? isCustom = null,Object? hasProjector = null,Object? projectorPath = freezed,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,catalogId: freezed == catalogId ? _self.catalogId : catalogId // ignore: cast_nullable_to_non_nullable
as String?,fileSizeLabel: freezed == fileSizeLabel ? _self.fileSizeLabel : fileSizeLabel // ignore: cast_nullable_to_non_nullable
as String?,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,hasProjector: null == hasProjector ? _self.hasProjector : hasProjector // ignore: cast_nullable_to_non_nullable
as bool,projectorPath: freezed == projectorPath ? _self.projectorPath : projectorPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalModelEntry].
extension LocalModelEntryPatterns on LocalModelEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalModelEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalModelEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalModelEntry value)  $default,){
final _that = this;
switch (_that) {
case _LocalModelEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalModelEntry value)?  $default,){
final _that = this;
switch (_that) {
case _LocalModelEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String displayName,  String? catalogId,  String? fileSizeLabel,  String? badge,  bool isCustom,  bool hasProjector,  String? projectorPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalModelEntry() when $default != null:
return $default(_that.path,_that.displayName,_that.catalogId,_that.fileSizeLabel,_that.badge,_that.isCustom,_that.hasProjector,_that.projectorPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String displayName,  String? catalogId,  String? fileSizeLabel,  String? badge,  bool isCustom,  bool hasProjector,  String? projectorPath)  $default,) {final _that = this;
switch (_that) {
case _LocalModelEntry():
return $default(_that.path,_that.displayName,_that.catalogId,_that.fileSizeLabel,_that.badge,_that.isCustom,_that.hasProjector,_that.projectorPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String displayName,  String? catalogId,  String? fileSizeLabel,  String? badge,  bool isCustom,  bool hasProjector,  String? projectorPath)?  $default,) {final _that = this;
switch (_that) {
case _LocalModelEntry() when $default != null:
return $default(_that.path,_that.displayName,_that.catalogId,_that.fileSizeLabel,_that.badge,_that.isCustom,_that.hasProjector,_that.projectorPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalModelEntry extends LocalModelEntry {
  const _LocalModelEntry({required this.path, required this.displayName, this.catalogId, this.fileSizeLabel, this.badge, this.isCustom = false, this.hasProjector = false, this.projectorPath}): super._();
  factory _LocalModelEntry.fromJson(Map<String, dynamic> json) => _$LocalModelEntryFromJson(json);

@override final  String path;
@override final  String displayName;
@override final  String? catalogId;
@override final  String? fileSizeLabel;
@override final  String? badge;
@override@JsonKey() final  bool isCustom;
@override@JsonKey() final  bool hasProjector;
@override final  String? projectorPath;

/// Create a copy of LocalModelEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalModelEntryCopyWith<_LocalModelEntry> get copyWith => __$LocalModelEntryCopyWithImpl<_LocalModelEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalModelEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalModelEntry&&(identical(other.path, path) || other.path == path)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.catalogId, catalogId) || other.catalogId == catalogId)&&(identical(other.fileSizeLabel, fileSizeLabel) || other.fileSizeLabel == fileSizeLabel)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.hasProjector, hasProjector) || other.hasProjector == hasProjector)&&(identical(other.projectorPath, projectorPath) || other.projectorPath == projectorPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,displayName,catalogId,fileSizeLabel,badge,isCustom,hasProjector,projectorPath);

@override
String toString() {
  return 'LocalModelEntry(path: $path, displayName: $displayName, catalogId: $catalogId, fileSizeLabel: $fileSizeLabel, badge: $badge, isCustom: $isCustom, hasProjector: $hasProjector, projectorPath: $projectorPath)';
}


}

/// @nodoc
abstract mixin class _$LocalModelEntryCopyWith<$Res> implements $LocalModelEntryCopyWith<$Res> {
  factory _$LocalModelEntryCopyWith(_LocalModelEntry value, $Res Function(_LocalModelEntry) _then) = __$LocalModelEntryCopyWithImpl;
@override @useResult
$Res call({
 String path, String displayName, String? catalogId, String? fileSizeLabel, String? badge, bool isCustom, bool hasProjector, String? projectorPath
});




}
/// @nodoc
class __$LocalModelEntryCopyWithImpl<$Res>
    implements _$LocalModelEntryCopyWith<$Res> {
  __$LocalModelEntryCopyWithImpl(this._self, this._then);

  final _LocalModelEntry _self;
  final $Res Function(_LocalModelEntry) _then;

/// Create a copy of LocalModelEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? displayName = null,Object? catalogId = freezed,Object? fileSizeLabel = freezed,Object? badge = freezed,Object? isCustom = null,Object? hasProjector = null,Object? projectorPath = freezed,}) {
  return _then(_LocalModelEntry(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,catalogId: freezed == catalogId ? _self.catalogId : catalogId // ignore: cast_nullable_to_non_nullable
as String?,fileSizeLabel: freezed == fileSizeLabel ? _self.fileSizeLabel : fileSizeLabel // ignore: cast_nullable_to_non_nullable
as String?,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,hasProjector: null == hasProjector ? _self.hasProjector : hasProjector // ignore: cast_nullable_to_non_nullable
as bool,projectorPath: freezed == projectorPath ? _self.projectorPath : projectorPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
