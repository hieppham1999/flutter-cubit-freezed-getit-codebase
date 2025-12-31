// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../qr_eye_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrEyeStyle {

 EyeType get shape; int get color;
/// Create a copy of QrEyeStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrEyeStyleCopyWith<QrEyeStyle> get copyWith => _$QrEyeStyleCopyWithImpl<QrEyeStyle>(this as QrEyeStyle, _$identity);

  /// Serializes this QrEyeStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrEyeStyle&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shape,color);

@override
String toString() {
  return 'QrEyeStyle(shape: $shape, color: $color)';
}


}

/// @nodoc
abstract mixin class $QrEyeStyleCopyWith<$Res>  {
  factory $QrEyeStyleCopyWith(QrEyeStyle value, $Res Function(QrEyeStyle) _then) = _$QrEyeStyleCopyWithImpl;
@useResult
$Res call({
 EyeType shape, int color
});




}
/// @nodoc
class _$QrEyeStyleCopyWithImpl<$Res>
    implements $QrEyeStyleCopyWith<$Res> {
  _$QrEyeStyleCopyWithImpl(this._self, this._then);

  final QrEyeStyle _self;
  final $Res Function(QrEyeStyle) _then;

/// Create a copy of QrEyeStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shape = null,Object? color = null,}) {
  return _then(_self.copyWith(
shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as EyeType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QrEyeStyle].
extension QrEyeStylePatterns on QrEyeStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrEyeStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrEyeStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrEyeStyle value)  $default,){
final _that = this;
switch (_that) {
case _QrEyeStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrEyeStyle value)?  $default,){
final _that = this;
switch (_that) {
case _QrEyeStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EyeType shape,  int color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrEyeStyle() when $default != null:
return $default(_that.shape,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EyeType shape,  int color)  $default,) {final _that = this;
switch (_that) {
case _QrEyeStyle():
return $default(_that.shape,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EyeType shape,  int color)?  $default,) {final _that = this;
switch (_that) {
case _QrEyeStyle() when $default != null:
return $default(_that.shape,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrEyeStyle extends QrEyeStyle {
  const _QrEyeStyle({this.shape = EyeType.square, this.color = _defaultEyeColor}): super._();
  factory _QrEyeStyle.fromJson(Map<String, dynamic> json) => _$QrEyeStyleFromJson(json);

@override@JsonKey() final  EyeType shape;
@override@JsonKey() final  int color;

/// Create a copy of QrEyeStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrEyeStyleCopyWith<_QrEyeStyle> get copyWith => __$QrEyeStyleCopyWithImpl<_QrEyeStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrEyeStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrEyeStyle&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shape,color);

@override
String toString() {
  return 'QrEyeStyle(shape: $shape, color: $color)';
}


}

/// @nodoc
abstract mixin class _$QrEyeStyleCopyWith<$Res> implements $QrEyeStyleCopyWith<$Res> {
  factory _$QrEyeStyleCopyWith(_QrEyeStyle value, $Res Function(_QrEyeStyle) _then) = __$QrEyeStyleCopyWithImpl;
@override @useResult
$Res call({
 EyeType shape, int color
});




}
/// @nodoc
class __$QrEyeStyleCopyWithImpl<$Res>
    implements _$QrEyeStyleCopyWith<$Res> {
  __$QrEyeStyleCopyWithImpl(this._self, this._then);

  final _QrEyeStyle _self;
  final $Res Function(_QrEyeStyle) _then;

/// Create a copy of QrEyeStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shape = null,Object? color = null,}) {
  return _then(_QrEyeStyle(
shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as EyeType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
