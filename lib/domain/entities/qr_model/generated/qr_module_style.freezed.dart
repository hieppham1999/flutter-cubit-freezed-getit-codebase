// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../qr_module_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrModuleStyle {

 ModuleType get shape; int get color;
/// Create a copy of QrModuleStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrModuleStyleCopyWith<QrModuleStyle> get copyWith => _$QrModuleStyleCopyWithImpl<QrModuleStyle>(this as QrModuleStyle, _$identity);

  /// Serializes this QrModuleStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrModuleStyle&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shape,color);

@override
String toString() {
  return 'QrModuleStyle(shape: $shape, color: $color)';
}


}

/// @nodoc
abstract mixin class $QrModuleStyleCopyWith<$Res>  {
  factory $QrModuleStyleCopyWith(QrModuleStyle value, $Res Function(QrModuleStyle) _then) = _$QrModuleStyleCopyWithImpl;
@useResult
$Res call({
 ModuleType shape, int color
});




}
/// @nodoc
class _$QrModuleStyleCopyWithImpl<$Res>
    implements $QrModuleStyleCopyWith<$Res> {
  _$QrModuleStyleCopyWithImpl(this._self, this._then);

  final QrModuleStyle _self;
  final $Res Function(QrModuleStyle) _then;

/// Create a copy of QrModuleStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shape = null,Object? color = null,}) {
  return _then(_self.copyWith(
shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as ModuleType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QrModuleStyle].
extension QrModuleStylePatterns on QrModuleStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrModuleStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrModuleStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrModuleStyle value)  $default,){
final _that = this;
switch (_that) {
case _QrModuleStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrModuleStyle value)?  $default,){
final _that = this;
switch (_that) {
case _QrModuleStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ModuleType shape,  int color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrModuleStyle() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ModuleType shape,  int color)  $default,) {final _that = this;
switch (_that) {
case _QrModuleStyle():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ModuleType shape,  int color)?  $default,) {final _that = this;
switch (_that) {
case _QrModuleStyle() when $default != null:
return $default(_that.shape,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrModuleStyle extends QrModuleStyle {
  const _QrModuleStyle({this.shape = ModuleType.square, this.color = _defaultModuleColor}): super._();
  factory _QrModuleStyle.fromJson(Map<String, dynamic> json) => _$QrModuleStyleFromJson(json);

@override@JsonKey() final  ModuleType shape;
@override@JsonKey() final  int color;

/// Create a copy of QrModuleStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrModuleStyleCopyWith<_QrModuleStyle> get copyWith => __$QrModuleStyleCopyWithImpl<_QrModuleStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrModuleStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrModuleStyle&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shape,color);

@override
String toString() {
  return 'QrModuleStyle(shape: $shape, color: $color)';
}


}

/// @nodoc
abstract mixin class _$QrModuleStyleCopyWith<$Res> implements $QrModuleStyleCopyWith<$Res> {
  factory _$QrModuleStyleCopyWith(_QrModuleStyle value, $Res Function(_QrModuleStyle) _then) = __$QrModuleStyleCopyWithImpl;
@override @useResult
$Res call({
 ModuleType shape, int color
});




}
/// @nodoc
class __$QrModuleStyleCopyWithImpl<$Res>
    implements _$QrModuleStyleCopyWith<$Res> {
  __$QrModuleStyleCopyWithImpl(this._self, this._then);

  final _QrModuleStyle _self;
  final $Res Function(_QrModuleStyle) _then;

/// Create a copy of QrModuleStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shape = null,Object? color = null,}) {
  return _then(_QrModuleStyle(
shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as ModuleType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
