// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salman_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalmanModel {

 String? get message;
/// Create a copy of SalmanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalmanModelCopyWith<SalmanModel> get copyWith => _$SalmanModelCopyWithImpl<SalmanModel>(this as SalmanModel, _$identity);

  /// Serializes this SalmanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalmanModel&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SalmanModel(message: $message)';
}


}

/// @nodoc
abstract mixin class $SalmanModelCopyWith<$Res>  {
  factory $SalmanModelCopyWith(SalmanModel value, $Res Function(SalmanModel) _then) = _$SalmanModelCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$SalmanModelCopyWithImpl<$Res>
    implements $SalmanModelCopyWith<$Res> {
  _$SalmanModelCopyWithImpl(this._self, this._then);

  final SalmanModel _self;
  final $Res Function(SalmanModel) _then;

/// Create a copy of SalmanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SalmanModel].
extension SalmanModelPatterns on SalmanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalmanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalmanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalmanModel value)  $default,){
final _that = this;
switch (_that) {
case _SalmanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalmanModel value)?  $default,){
final _that = this;
switch (_that) {
case _SalmanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalmanModel() when $default != null:
return $default(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message)  $default,) {final _that = this;
switch (_that) {
case _SalmanModel():
return $default(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message)?  $default,) {final _that = this;
switch (_that) {
case _SalmanModel() when $default != null:
return $default(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalmanModel implements SalmanModel {
   _SalmanModel({this.message});
  factory _SalmanModel.fromJson(Map<String, dynamic> json) => _$SalmanModelFromJson(json);

@override final  String? message;

/// Create a copy of SalmanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalmanModelCopyWith<_SalmanModel> get copyWith => __$SalmanModelCopyWithImpl<_SalmanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalmanModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalmanModel&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SalmanModel(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SalmanModelCopyWith<$Res> implements $SalmanModelCopyWith<$Res> {
  factory _$SalmanModelCopyWith(_SalmanModel value, $Res Function(_SalmanModel) _then) = __$SalmanModelCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$SalmanModelCopyWithImpl<$Res>
    implements _$SalmanModelCopyWith<$Res> {
  __$SalmanModelCopyWithImpl(this._self, this._then);

  final _SalmanModel _self;
  final $Res Function(_SalmanModel) _then;

/// Create a copy of SalmanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_SalmanModel(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
