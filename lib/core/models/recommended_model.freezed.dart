// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommended_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendedModel {

 String get id; String get displayName; String get description; String get badge; String get fileSizeLabel; int get fileSizeBytes; String get downloadUrl; String get fileName; String get ramRequirement; String? get projectorDownloadUrl; String? get projectorFileName; String? get projectorSizeLabel; int get projectorSizeBytes;
/// Create a copy of RecommendedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedModelCopyWith<RecommendedModel> get copyWith => _$RecommendedModelCopyWithImpl<RecommendedModel>(this as RecommendedModel, _$identity);

  /// Serializes this RecommendedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.description, description) || other.description == description)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.fileSizeLabel, fileSizeLabel) || other.fileSizeLabel == fileSizeLabel)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.ramRequirement, ramRequirement) || other.ramRequirement == ramRequirement)&&(identical(other.projectorDownloadUrl, projectorDownloadUrl) || other.projectorDownloadUrl == projectorDownloadUrl)&&(identical(other.projectorFileName, projectorFileName) || other.projectorFileName == projectorFileName)&&(identical(other.projectorSizeLabel, projectorSizeLabel) || other.projectorSizeLabel == projectorSizeLabel)&&(identical(other.projectorSizeBytes, projectorSizeBytes) || other.projectorSizeBytes == projectorSizeBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,description,badge,fileSizeLabel,fileSizeBytes,downloadUrl,fileName,ramRequirement,projectorDownloadUrl,projectorFileName,projectorSizeLabel,projectorSizeBytes);

@override
String toString() {
  return 'RecommendedModel(id: $id, displayName: $displayName, description: $description, badge: $badge, fileSizeLabel: $fileSizeLabel, fileSizeBytes: $fileSizeBytes, downloadUrl: $downloadUrl, fileName: $fileName, ramRequirement: $ramRequirement, projectorDownloadUrl: $projectorDownloadUrl, projectorFileName: $projectorFileName, projectorSizeLabel: $projectorSizeLabel, projectorSizeBytes: $projectorSizeBytes)';
}


}

/// @nodoc
abstract mixin class $RecommendedModelCopyWith<$Res>  {
  factory $RecommendedModelCopyWith(RecommendedModel value, $Res Function(RecommendedModel) _then) = _$RecommendedModelCopyWithImpl;
@useResult
$Res call({
 String id, String displayName, String description, String badge, String fileSizeLabel, int fileSizeBytes, String downloadUrl, String fileName, String ramRequirement, String? projectorDownloadUrl, String? projectorFileName, String? projectorSizeLabel, int projectorSizeBytes
});




}
/// @nodoc
class _$RecommendedModelCopyWithImpl<$Res>
    implements $RecommendedModelCopyWith<$Res> {
  _$RecommendedModelCopyWithImpl(this._self, this._then);

  final RecommendedModel _self;
  final $Res Function(RecommendedModel) _then;

/// Create a copy of RecommendedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? description = null,Object? badge = null,Object? fileSizeLabel = null,Object? fileSizeBytes = null,Object? downloadUrl = null,Object? fileName = null,Object? ramRequirement = null,Object? projectorDownloadUrl = freezed,Object? projectorFileName = freezed,Object? projectorSizeLabel = freezed,Object? projectorSizeBytes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,fileSizeLabel: null == fileSizeLabel ? _self.fileSizeLabel : fileSizeLabel // ignore: cast_nullable_to_non_nullable
as String,fileSizeBytes: null == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,ramRequirement: null == ramRequirement ? _self.ramRequirement : ramRequirement // ignore: cast_nullable_to_non_nullable
as String,projectorDownloadUrl: freezed == projectorDownloadUrl ? _self.projectorDownloadUrl : projectorDownloadUrl // ignore: cast_nullable_to_non_nullable
as String?,projectorFileName: freezed == projectorFileName ? _self.projectorFileName : projectorFileName // ignore: cast_nullable_to_non_nullable
as String?,projectorSizeLabel: freezed == projectorSizeLabel ? _self.projectorSizeLabel : projectorSizeLabel // ignore: cast_nullable_to_non_nullable
as String?,projectorSizeBytes: null == projectorSizeBytes ? _self.projectorSizeBytes : projectorSizeBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendedModel].
extension RecommendedModelPatterns on RecommendedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedModel value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String displayName,  String description,  String badge,  String fileSizeLabel,  int fileSizeBytes,  String downloadUrl,  String fileName,  String ramRequirement,  String? projectorDownloadUrl,  String? projectorFileName,  String? projectorSizeLabel,  int projectorSizeBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedModel() when $default != null:
return $default(_that.id,_that.displayName,_that.description,_that.badge,_that.fileSizeLabel,_that.fileSizeBytes,_that.downloadUrl,_that.fileName,_that.ramRequirement,_that.projectorDownloadUrl,_that.projectorFileName,_that.projectorSizeLabel,_that.projectorSizeBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String displayName,  String description,  String badge,  String fileSizeLabel,  int fileSizeBytes,  String downloadUrl,  String fileName,  String ramRequirement,  String? projectorDownloadUrl,  String? projectorFileName,  String? projectorSizeLabel,  int projectorSizeBytes)  $default,) {final _that = this;
switch (_that) {
case _RecommendedModel():
return $default(_that.id,_that.displayName,_that.description,_that.badge,_that.fileSizeLabel,_that.fileSizeBytes,_that.downloadUrl,_that.fileName,_that.ramRequirement,_that.projectorDownloadUrl,_that.projectorFileName,_that.projectorSizeLabel,_that.projectorSizeBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String displayName,  String description,  String badge,  String fileSizeLabel,  int fileSizeBytes,  String downloadUrl,  String fileName,  String ramRequirement,  String? projectorDownloadUrl,  String? projectorFileName,  String? projectorSizeLabel,  int projectorSizeBytes)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedModel() when $default != null:
return $default(_that.id,_that.displayName,_that.description,_that.badge,_that.fileSizeLabel,_that.fileSizeBytes,_that.downloadUrl,_that.fileName,_that.ramRequirement,_that.projectorDownloadUrl,_that.projectorFileName,_that.projectorSizeLabel,_that.projectorSizeBytes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedModel implements RecommendedModel {
  const _RecommendedModel({required this.id, required this.displayName, required this.description, required this.badge, required this.fileSizeLabel, required this.fileSizeBytes, required this.downloadUrl, required this.fileName, required this.ramRequirement, this.projectorDownloadUrl, this.projectorFileName, this.projectorSizeLabel, this.projectorSizeBytes = 0});
  factory _RecommendedModel.fromJson(Map<String, dynamic> json) => _$RecommendedModelFromJson(json);

@override final  String id;
@override final  String displayName;
@override final  String description;
@override final  String badge;
@override final  String fileSizeLabel;
@override final  int fileSizeBytes;
@override final  String downloadUrl;
@override final  String fileName;
@override final  String ramRequirement;
@override final  String? projectorDownloadUrl;
@override final  String? projectorFileName;
@override final  String? projectorSizeLabel;
@override@JsonKey() final  int projectorSizeBytes;

/// Create a copy of RecommendedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedModelCopyWith<_RecommendedModel> get copyWith => __$RecommendedModelCopyWithImpl<_RecommendedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.description, description) || other.description == description)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.fileSizeLabel, fileSizeLabel) || other.fileSizeLabel == fileSizeLabel)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.ramRequirement, ramRequirement) || other.ramRequirement == ramRequirement)&&(identical(other.projectorDownloadUrl, projectorDownloadUrl) || other.projectorDownloadUrl == projectorDownloadUrl)&&(identical(other.projectorFileName, projectorFileName) || other.projectorFileName == projectorFileName)&&(identical(other.projectorSizeLabel, projectorSizeLabel) || other.projectorSizeLabel == projectorSizeLabel)&&(identical(other.projectorSizeBytes, projectorSizeBytes) || other.projectorSizeBytes == projectorSizeBytes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,description,badge,fileSizeLabel,fileSizeBytes,downloadUrl,fileName,ramRequirement,projectorDownloadUrl,projectorFileName,projectorSizeLabel,projectorSizeBytes);

@override
String toString() {
  return 'RecommendedModel(id: $id, displayName: $displayName, description: $description, badge: $badge, fileSizeLabel: $fileSizeLabel, fileSizeBytes: $fileSizeBytes, downloadUrl: $downloadUrl, fileName: $fileName, ramRequirement: $ramRequirement, projectorDownloadUrl: $projectorDownloadUrl, projectorFileName: $projectorFileName, projectorSizeLabel: $projectorSizeLabel, projectorSizeBytes: $projectorSizeBytes)';
}


}

/// @nodoc
abstract mixin class _$RecommendedModelCopyWith<$Res> implements $RecommendedModelCopyWith<$Res> {
  factory _$RecommendedModelCopyWith(_RecommendedModel value, $Res Function(_RecommendedModel) _then) = __$RecommendedModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String displayName, String description, String badge, String fileSizeLabel, int fileSizeBytes, String downloadUrl, String fileName, String ramRequirement, String? projectorDownloadUrl, String? projectorFileName, String? projectorSizeLabel, int projectorSizeBytes
});




}
/// @nodoc
class __$RecommendedModelCopyWithImpl<$Res>
    implements _$RecommendedModelCopyWith<$Res> {
  __$RecommendedModelCopyWithImpl(this._self, this._then);

  final _RecommendedModel _self;
  final $Res Function(_RecommendedModel) _then;

/// Create a copy of RecommendedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? description = null,Object? badge = null,Object? fileSizeLabel = null,Object? fileSizeBytes = null,Object? downloadUrl = null,Object? fileName = null,Object? ramRequirement = null,Object? projectorDownloadUrl = freezed,Object? projectorFileName = freezed,Object? projectorSizeLabel = freezed,Object? projectorSizeBytes = null,}) {
  return _then(_RecommendedModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,fileSizeLabel: null == fileSizeLabel ? _self.fileSizeLabel : fileSizeLabel // ignore: cast_nullable_to_non_nullable
as String,fileSizeBytes: null == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,ramRequirement: null == ramRequirement ? _self.ramRequirement : ramRequirement // ignore: cast_nullable_to_non_nullable
as String,projectorDownloadUrl: freezed == projectorDownloadUrl ? _self.projectorDownloadUrl : projectorDownloadUrl // ignore: cast_nullable_to_non_nullable
as String?,projectorFileName: freezed == projectorFileName ? _self.projectorFileName : projectorFileName // ignore: cast_nullable_to_non_nullable
as String?,projectorSizeLabel: freezed == projectorSizeLabel ? _self.projectorSizeLabel : projectorSizeLabel // ignore: cast_nullable_to_non_nullable
as String?,projectorSizeBytes: null == projectorSizeBytes ? _self.projectorSizeBytes : projectorSizeBytes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
