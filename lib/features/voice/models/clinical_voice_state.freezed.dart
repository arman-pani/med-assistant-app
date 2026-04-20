// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clinical_voice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClinicalVoiceState {

 VoiceSessionStatus get status; String get liveTranscript; String get finalTranscript; String get prescriptionMarkdown; bool get isGenerating; String? get errorMessage; String get patientName; String get doctorName; String get clinicName;
/// Create a copy of ClinicalVoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClinicalVoiceStateCopyWith<ClinicalVoiceState> get copyWith => _$ClinicalVoiceStateCopyWithImpl<ClinicalVoiceState>(this as ClinicalVoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClinicalVoiceState&&(identical(other.status, status) || other.status == status)&&(identical(other.liveTranscript, liveTranscript) || other.liveTranscript == liveTranscript)&&(identical(other.finalTranscript, finalTranscript) || other.finalTranscript == finalTranscript)&&(identical(other.prescriptionMarkdown, prescriptionMarkdown) || other.prescriptionMarkdown == prescriptionMarkdown)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName));
}


@override
int get hashCode => Object.hash(runtimeType,status,liveTranscript,finalTranscript,prescriptionMarkdown,isGenerating,errorMessage,patientName,doctorName,clinicName);

@override
String toString() {
  return 'ClinicalVoiceState(status: $status, liveTranscript: $liveTranscript, finalTranscript: $finalTranscript, prescriptionMarkdown: $prescriptionMarkdown, isGenerating: $isGenerating, errorMessage: $errorMessage, patientName: $patientName, doctorName: $doctorName, clinicName: $clinicName)';
}


}

/// @nodoc
abstract mixin class $ClinicalVoiceStateCopyWith<$Res>  {
  factory $ClinicalVoiceStateCopyWith(ClinicalVoiceState value, $Res Function(ClinicalVoiceState) _then) = _$ClinicalVoiceStateCopyWithImpl;
@useResult
$Res call({
 VoiceSessionStatus status, String liveTranscript, String finalTranscript, String prescriptionMarkdown, bool isGenerating, String? errorMessage, String patientName, String doctorName, String clinicName
});




}
/// @nodoc
class _$ClinicalVoiceStateCopyWithImpl<$Res>
    implements $ClinicalVoiceStateCopyWith<$Res> {
  _$ClinicalVoiceStateCopyWithImpl(this._self, this._then);

  final ClinicalVoiceState _self;
  final $Res Function(ClinicalVoiceState) _then;

/// Create a copy of ClinicalVoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? liveTranscript = null,Object? finalTranscript = null,Object? prescriptionMarkdown = null,Object? isGenerating = null,Object? errorMessage = freezed,Object? patientName = null,Object? doctorName = null,Object? clinicName = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VoiceSessionStatus,liveTranscript: null == liveTranscript ? _self.liveTranscript : liveTranscript // ignore: cast_nullable_to_non_nullable
as String,finalTranscript: null == finalTranscript ? _self.finalTranscript : finalTranscript // ignore: cast_nullable_to_non_nullable
as String,prescriptionMarkdown: null == prescriptionMarkdown ? _self.prescriptionMarkdown : prescriptionMarkdown // ignore: cast_nullable_to_non_nullable
as String,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,clinicName: null == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClinicalVoiceState].
extension ClinicalVoiceStatePatterns on ClinicalVoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClinicalVoiceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClinicalVoiceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClinicalVoiceState value)  $default,){
final _that = this;
switch (_that) {
case _ClinicalVoiceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClinicalVoiceState value)?  $default,){
final _that = this;
switch (_that) {
case _ClinicalVoiceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VoiceSessionStatus status,  String liveTranscript,  String finalTranscript,  String prescriptionMarkdown,  bool isGenerating,  String? errorMessage,  String patientName,  String doctorName,  String clinicName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClinicalVoiceState() when $default != null:
return $default(_that.status,_that.liveTranscript,_that.finalTranscript,_that.prescriptionMarkdown,_that.isGenerating,_that.errorMessage,_that.patientName,_that.doctorName,_that.clinicName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VoiceSessionStatus status,  String liveTranscript,  String finalTranscript,  String prescriptionMarkdown,  bool isGenerating,  String? errorMessage,  String patientName,  String doctorName,  String clinicName)  $default,) {final _that = this;
switch (_that) {
case _ClinicalVoiceState():
return $default(_that.status,_that.liveTranscript,_that.finalTranscript,_that.prescriptionMarkdown,_that.isGenerating,_that.errorMessage,_that.patientName,_that.doctorName,_that.clinicName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VoiceSessionStatus status,  String liveTranscript,  String finalTranscript,  String prescriptionMarkdown,  bool isGenerating,  String? errorMessage,  String patientName,  String doctorName,  String clinicName)?  $default,) {final _that = this;
switch (_that) {
case _ClinicalVoiceState() when $default != null:
return $default(_that.status,_that.liveTranscript,_that.finalTranscript,_that.prescriptionMarkdown,_that.isGenerating,_that.errorMessage,_that.patientName,_that.doctorName,_that.clinicName);case _:
  return null;

}
}

}

/// @nodoc


class _ClinicalVoiceState implements ClinicalVoiceState {
  const _ClinicalVoiceState({this.status = VoiceSessionStatus.idle, this.liveTranscript = '', this.finalTranscript = '', this.prescriptionMarkdown = '', this.isGenerating = false, this.errorMessage, this.patientName = '', this.doctorName = '', this.clinicName = ''});
  

@override@JsonKey() final  VoiceSessionStatus status;
@override@JsonKey() final  String liveTranscript;
@override@JsonKey() final  String finalTranscript;
@override@JsonKey() final  String prescriptionMarkdown;
@override@JsonKey() final  bool isGenerating;
@override final  String? errorMessage;
@override@JsonKey() final  String patientName;
@override@JsonKey() final  String doctorName;
@override@JsonKey() final  String clinicName;

/// Create a copy of ClinicalVoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClinicalVoiceStateCopyWith<_ClinicalVoiceState> get copyWith => __$ClinicalVoiceStateCopyWithImpl<_ClinicalVoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClinicalVoiceState&&(identical(other.status, status) || other.status == status)&&(identical(other.liveTranscript, liveTranscript) || other.liveTranscript == liveTranscript)&&(identical(other.finalTranscript, finalTranscript) || other.finalTranscript == finalTranscript)&&(identical(other.prescriptionMarkdown, prescriptionMarkdown) || other.prescriptionMarkdown == prescriptionMarkdown)&&(identical(other.isGenerating, isGenerating) || other.isGenerating == isGenerating)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.clinicName, clinicName) || other.clinicName == clinicName));
}


@override
int get hashCode => Object.hash(runtimeType,status,liveTranscript,finalTranscript,prescriptionMarkdown,isGenerating,errorMessage,patientName,doctorName,clinicName);

@override
String toString() {
  return 'ClinicalVoiceState(status: $status, liveTranscript: $liveTranscript, finalTranscript: $finalTranscript, prescriptionMarkdown: $prescriptionMarkdown, isGenerating: $isGenerating, errorMessage: $errorMessage, patientName: $patientName, doctorName: $doctorName, clinicName: $clinicName)';
}


}

/// @nodoc
abstract mixin class _$ClinicalVoiceStateCopyWith<$Res> implements $ClinicalVoiceStateCopyWith<$Res> {
  factory _$ClinicalVoiceStateCopyWith(_ClinicalVoiceState value, $Res Function(_ClinicalVoiceState) _then) = __$ClinicalVoiceStateCopyWithImpl;
@override @useResult
$Res call({
 VoiceSessionStatus status, String liveTranscript, String finalTranscript, String prescriptionMarkdown, bool isGenerating, String? errorMessage, String patientName, String doctorName, String clinicName
});




}
/// @nodoc
class __$ClinicalVoiceStateCopyWithImpl<$Res>
    implements _$ClinicalVoiceStateCopyWith<$Res> {
  __$ClinicalVoiceStateCopyWithImpl(this._self, this._then);

  final _ClinicalVoiceState _self;
  final $Res Function(_ClinicalVoiceState) _then;

/// Create a copy of ClinicalVoiceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? liveTranscript = null,Object? finalTranscript = null,Object? prescriptionMarkdown = null,Object? isGenerating = null,Object? errorMessage = freezed,Object? patientName = null,Object? doctorName = null,Object? clinicName = null,}) {
  return _then(_ClinicalVoiceState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VoiceSessionStatus,liveTranscript: null == liveTranscript ? _self.liveTranscript : liveTranscript // ignore: cast_nullable_to_non_nullable
as String,finalTranscript: null == finalTranscript ? _self.finalTranscript : finalTranscript // ignore: cast_nullable_to_non_nullable
as String,prescriptionMarkdown: null == prescriptionMarkdown ? _self.prescriptionMarkdown : prescriptionMarkdown // ignore: cast_nullable_to_non_nullable
as String,isGenerating: null == isGenerating ? _self.isGenerating : isGenerating // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,clinicName: null == clinicName ? _self.clinicName : clinicName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
