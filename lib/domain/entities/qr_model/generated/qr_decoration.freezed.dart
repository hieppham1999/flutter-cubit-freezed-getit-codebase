// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../qr_decoration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrDecoration {

 QrEyeStyle get eyeStyle; QrModuleStyle get moduleStyle; int get backgroundColor;
/// Create a copy of QrDecoration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrDecorationCopyWith<QrDecoration> get copyWith => _$QrDecorationCopyWithImpl<QrDecoration>(this as QrDecoration, _$identity);

  /// Serializes this QrDecoration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrDecoration&&(identical(other.eyeStyle, eyeStyle) || other.eyeStyle == eyeStyle)&&(identical(other.moduleStyle, moduleStyle) || other.moduleStyle == moduleStyle)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eyeStyle,moduleStyle,backgroundColor);

@override
String toString() {
  return 'QrDecoration(eyeStyle: $eyeStyle, moduleStyle: $moduleStyle, backgroundColor: $backgroundColor)';
}


}

/// @nodoc
abstract mixin class $QrDecorationCopyWith<$Res>  {
  factory $QrDecorationCopyWith(QrDecoration value, $Res Function(QrDecoration) _then) = _$QrDecorationCopyWithImpl;
@useResult
$Res call({
 QrEyeStyle eyeStyle, QrModuleStyle moduleStyle, int backgroundColor
});


$QrEyeStyleCopyWith<$Res> get eyeStyle;$QrModuleStyleCopyWith<$Res> get moduleStyle;

}
/// @nodoc
class _$QrDecorationCopyWithImpl<$Res>
    implements $QrDecorationCopyWith<$Res> {
  _$QrDecorationCopyWithImpl(this._self, this._then);

  final QrDecoration _self;
  final $Res Function(QrDecoration) _then;

/// Create a copy of QrDecoration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eyeStyle = null,Object? moduleStyle = null,Object? backgroundColor = null,}) {
  return _then(_self.copyWith(
eyeStyle: null == eyeStyle ? _self.eyeStyle : eyeStyle // ignore: cast_nullable_to_non_nullable
as QrEyeStyle,moduleStyle: null == moduleStyle ? _self.moduleStyle : moduleStyle // ignore: cast_nullable_to_non_nullable
as QrModuleStyle,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of QrDecoration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrEyeStyleCopyWith<$Res> get eyeStyle {
  
  return $QrEyeStyleCopyWith<$Res>(_self.eyeStyle, (value) {
    return _then(_self.copyWith(eyeStyle: value));
  });
}/// Create a copy of QrDecoration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrModuleStyleCopyWith<$Res> get moduleStyle {
  
  return $QrModuleStyleCopyWith<$Res>(_self.moduleStyle, (value) {
    return _then(_self.copyWith(moduleStyle: value));
  });
}
}


/// Adds pattern-matching-related methods to [QrDecoration].
extension QrDecorationPatterns on QrDecoration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrDecoration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrDecoration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrDecoration value)  $default,){
final _that = this;
switch (_that) {
case _QrDecoration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrDecoration value)?  $default,){
final _that = this;
switch (_that) {
case _QrDecoration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QrEyeStyle eyeStyle,  QrModuleStyle moduleStyle,  int backgroundColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrDecoration() when $default != null:
return $default(_that.eyeStyle,_that.moduleStyle,_that.backgroundColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QrEyeStyle eyeStyle,  QrModuleStyle moduleStyle,  int backgroundColor)  $default,) {final _that = this;
switch (_that) {
case _QrDecoration():
return $default(_that.eyeStyle,_that.moduleStyle,_that.backgroundColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QrEyeStyle eyeStyle,  QrModuleStyle moduleStyle,  int backgroundColor)?  $default,) {final _that = this;
switch (_that) {
case _QrDecoration() when $default != null:
return $default(_that.eyeStyle,_that.moduleStyle,_that.backgroundColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrDecoration extends QrDecoration {
  const _QrDecoration({this.eyeStyle = const QrEyeStyle(), this.moduleStyle = const QrModuleStyle(), this.backgroundColor = 0xFFFFFFFF}): super._();
  factory _QrDecoration.fromJson(Map<String, dynamic> json) => _$QrDecorationFromJson(json);

@override@JsonKey() final  QrEyeStyle eyeStyle;
@override@JsonKey() final  QrModuleStyle moduleStyle;
@override@JsonKey() final  int backgroundColor;

/// Create a copy of QrDecoration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrDecorationCopyWith<_QrDecoration> get copyWith => __$QrDecorationCopyWithImpl<_QrDecoration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrDecorationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrDecoration&&(identical(other.eyeStyle, eyeStyle) || other.eyeStyle == eyeStyle)&&(identical(other.moduleStyle, moduleStyle) || other.moduleStyle == moduleStyle)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eyeStyle,moduleStyle,backgroundColor);

@override
String toString() {
  return 'QrDecoration(eyeStyle: $eyeStyle, moduleStyle: $moduleStyle, backgroundColor: $backgroundColor)';
}


}

/// @nodoc
abstract mixin class _$QrDecorationCopyWith<$Res> implements $QrDecorationCopyWith<$Res> {
  factory _$QrDecorationCopyWith(_QrDecoration value, $Res Function(_QrDecoration) _then) = __$QrDecorationCopyWithImpl;
@override @useResult
$Res call({
 QrEyeStyle eyeStyle, QrModuleStyle moduleStyle, int backgroundColor
});


@override $QrEyeStyleCopyWith<$Res> get eyeStyle;@override $QrModuleStyleCopyWith<$Res> get moduleStyle;

}
/// @nodoc
class __$QrDecorationCopyWithImpl<$Res>
    implements _$QrDecorationCopyWith<$Res> {
  __$QrDecorationCopyWithImpl(this._self, this._then);

  final _QrDecoration _self;
  final $Res Function(_QrDecoration) _then;

/// Create a copy of QrDecoration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eyeStyle = null,Object? moduleStyle = null,Object? backgroundColor = null,}) {
  return _then(_QrDecoration(
eyeStyle: null == eyeStyle ? _self.eyeStyle : eyeStyle // ignore: cast_nullable_to_non_nullable
as QrEyeStyle,moduleStyle: null == moduleStyle ? _self.moduleStyle : moduleStyle // ignore: cast_nullable_to_non_nullable
as QrModuleStyle,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of QrDecoration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrEyeStyleCopyWith<$Res> get eyeStyle {
  
  return $QrEyeStyleCopyWith<$Res>(_self.eyeStyle, (value) {
    return _then(_self.copyWith(eyeStyle: value));
  });
}/// Create a copy of QrDecoration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrModuleStyleCopyWith<$Res> get moduleStyle {
  
  return $QrModuleStyleCopyWith<$Res>(_self.moduleStyle, (value) {
    return _then(_self.copyWith(moduleStyle: value));
  });
}
}

// dart format on
