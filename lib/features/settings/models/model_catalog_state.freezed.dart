// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_catalog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModelCatalogState {

 List<LocalModelEntry> get localModels; String? get loadedModelPath; String? get loadingModelPath; bool get isLoadingModel; String? get errorMessage;
/// Create a copy of ModelCatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelCatalogStateCopyWith<ModelCatalogState> get copyWith => _$ModelCatalogStateCopyWithImpl<ModelCatalogState>(this as ModelCatalogState, _$identity);

  /// Serializes this ModelCatalogState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelCatalogState&&const DeepCollectionEquality().equals(other.localModels, localModels)&&(identical(other.loadedModelPath, loadedModelPath) || other.loadedModelPath == loadedModelPath)&&(identical(other.loadingModelPath, loadingModelPath) || other.loadingModelPath == loadingModelPath)&&(identical(other.isLoadingModel, isLoadingModel) || other.isLoadingModel == isLoadingModel)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(localModels),loadedModelPath,loadingModelPath,isLoadingModel,errorMessage);

@override
String toString() {
  return 'ModelCatalogState(localModels: $localModels, loadedModelPath: $loadedModelPath, loadingModelPath: $loadingModelPath, isLoadingModel: $isLoadingModel, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ModelCatalogStateCopyWith<$Res>  {
  factory $ModelCatalogStateCopyWith(ModelCatalogState value, $Res Function(ModelCatalogState) _then) = _$ModelCatalogStateCopyWithImpl;
@useResult
$Res call({
 List<LocalModelEntry> localModels, String? loadedModelPath, String? loadingModelPath, bool isLoadingModel, String? errorMessage
});




}
/// @nodoc
class _$ModelCatalogStateCopyWithImpl<$Res>
    implements $ModelCatalogStateCopyWith<$Res> {
  _$ModelCatalogStateCopyWithImpl(this._self, this._then);

  final ModelCatalogState _self;
  final $Res Function(ModelCatalogState) _then;

/// Create a copy of ModelCatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localModels = null,Object? loadedModelPath = freezed,Object? loadingModelPath = freezed,Object? isLoadingModel = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
localModels: null == localModels ? _self.localModels : localModels // ignore: cast_nullable_to_non_nullable
as List<LocalModelEntry>,loadedModelPath: freezed == loadedModelPath ? _self.loadedModelPath : loadedModelPath // ignore: cast_nullable_to_non_nullable
as String?,loadingModelPath: freezed == loadingModelPath ? _self.loadingModelPath : loadingModelPath // ignore: cast_nullable_to_non_nullable
as String?,isLoadingModel: null == isLoadingModel ? _self.isLoadingModel : isLoadingModel // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelCatalogState].
extension ModelCatalogStatePatterns on ModelCatalogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelCatalogState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelCatalogState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelCatalogState value)  $default,){
final _that = this;
switch (_that) {
case _ModelCatalogState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelCatalogState value)?  $default,){
final _that = this;
switch (_that) {
case _ModelCatalogState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LocalModelEntry> localModels,  String? loadedModelPath,  String? loadingModelPath,  bool isLoadingModel,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelCatalogState() when $default != null:
return $default(_that.localModels,_that.loadedModelPath,_that.loadingModelPath,_that.isLoadingModel,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LocalModelEntry> localModels,  String? loadedModelPath,  String? loadingModelPath,  bool isLoadingModel,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ModelCatalogState():
return $default(_that.localModels,_that.loadedModelPath,_that.loadingModelPath,_that.isLoadingModel,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LocalModelEntry> localModels,  String? loadedModelPath,  String? loadingModelPath,  bool isLoadingModel,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ModelCatalogState() when $default != null:
return $default(_that.localModels,_that.loadedModelPath,_that.loadingModelPath,_that.isLoadingModel,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelCatalogState extends ModelCatalogState {
  const _ModelCatalogState({final  List<LocalModelEntry> localModels = const [], this.loadedModelPath, this.loadingModelPath, this.isLoadingModel = false, this.errorMessage}): _localModels = localModels,super._();
  factory _ModelCatalogState.fromJson(Map<String, dynamic> json) => _$ModelCatalogStateFromJson(json);

 final  List<LocalModelEntry> _localModels;
@override@JsonKey() List<LocalModelEntry> get localModels {
  if (_localModels is EqualUnmodifiableListView) return _localModels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_localModels);
}

@override final  String? loadedModelPath;
@override final  String? loadingModelPath;
@override@JsonKey() final  bool isLoadingModel;
@override final  String? errorMessage;

/// Create a copy of ModelCatalogState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelCatalogStateCopyWith<_ModelCatalogState> get copyWith => __$ModelCatalogStateCopyWithImpl<_ModelCatalogState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelCatalogStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelCatalogState&&const DeepCollectionEquality().equals(other._localModels, _localModels)&&(identical(other.loadedModelPath, loadedModelPath) || other.loadedModelPath == loadedModelPath)&&(identical(other.loadingModelPath, loadingModelPath) || other.loadingModelPath == loadingModelPath)&&(identical(other.isLoadingModel, isLoadingModel) || other.isLoadingModel == isLoadingModel)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_localModels),loadedModelPath,loadingModelPath,isLoadingModel,errorMessage);

@override
String toString() {
  return 'ModelCatalogState(localModels: $localModels, loadedModelPath: $loadedModelPath, loadingModelPath: $loadingModelPath, isLoadingModel: $isLoadingModel, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ModelCatalogStateCopyWith<$Res> implements $ModelCatalogStateCopyWith<$Res> {
  factory _$ModelCatalogStateCopyWith(_ModelCatalogState value, $Res Function(_ModelCatalogState) _then) = __$ModelCatalogStateCopyWithImpl;
@override @useResult
$Res call({
 List<LocalModelEntry> localModels, String? loadedModelPath, String? loadingModelPath, bool isLoadingModel, String? errorMessage
});




}
/// @nodoc
class __$ModelCatalogStateCopyWithImpl<$Res>
    implements _$ModelCatalogStateCopyWith<$Res> {
  __$ModelCatalogStateCopyWithImpl(this._self, this._then);

  final _ModelCatalogState _self;
  final $Res Function(_ModelCatalogState) _then;

/// Create a copy of ModelCatalogState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localModels = null,Object? loadedModelPath = freezed,Object? loadingModelPath = freezed,Object? isLoadingModel = null,Object? errorMessage = freezed,}) {
  return _then(_ModelCatalogState(
localModels: null == localModels ? _self._localModels : localModels // ignore: cast_nullable_to_non_nullable
as List<LocalModelEntry>,loadedModelPath: freezed == loadedModelPath ? _self.loadedModelPath : loadedModelPath // ignore: cast_nullable_to_non_nullable
as String?,loadingModelPath: freezed == loadingModelPath ? _self.loadingModelPath : loadingModelPath // ignore: cast_nullable_to_non_nullable
as String?,isLoadingModel: null == isLoadingModel ? _self.isLoadingModel : isLoadingModel // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
