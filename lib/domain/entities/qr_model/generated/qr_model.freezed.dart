// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../qr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrModel {

 String get id; String? get content; String? get originalContent; QrDecoration get decoration; int get version; QrType get type;
/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrModelCopyWith<QrModel> get copyWith => _$QrModelCopyWithImpl<QrModel>(this as QrModel, _$identity);

  /// Serializes this QrModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.originalContent, originalContent) || other.originalContent == originalContent)&&(identical(other.decoration, decoration) || other.decoration == decoration)&&(identical(other.version, version) || other.version == version)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,originalContent,decoration,version,type);

@override
String toString() {
  return 'QrModel(id: $id, content: $content, originalContent: $originalContent, decoration: $decoration, version: $version, type: $type)';
}


}

/// @nodoc
abstract mixin class $QrModelCopyWith<$Res>  {
  factory $QrModelCopyWith(QrModel value, $Res Function(QrModel) _then) = _$QrModelCopyWithImpl;
@useResult
$Res call({
 String id, String? content, String? originalContent, QrDecoration decoration, int version, QrType type
});


$QrDecorationCopyWith<$Res> get decoration;

}
/// @nodoc
class _$QrModelCopyWithImpl<$Res>
    implements $QrModelCopyWith<$Res> {
  _$QrModelCopyWithImpl(this._self, this._then);

  final QrModel _self;
  final $Res Function(QrModel) _then;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = freezed,Object? originalContent = freezed,Object? decoration = null,Object? version = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,originalContent: freezed == originalContent ? _self.originalContent : originalContent // ignore: cast_nullable_to_non_nullable
as String?,decoration: null == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as QrDecoration,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QrType,
  ));
}
/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrDecorationCopyWith<$Res> get decoration {
  
  return $QrDecorationCopyWith<$Res>(_self.decoration, (value) {
    return _then(_self.copyWith(decoration: value));
  });
}
}


/// Adds pattern-matching-related methods to [QrModel].
extension QrModelPatterns on QrModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrModel value)  $default,){
final _that = this;
switch (_that) {
case _QrModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrModel value)?  $default,){
final _that = this;
switch (_that) {
case _QrModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? content,  String? originalContent,  QrDecoration decoration,  int version,  QrType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrModel() when $default != null:
return $default(_that.id,_that.content,_that.originalContent,_that.decoration,_that.version,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? content,  String? originalContent,  QrDecoration decoration,  int version,  QrType type)  $default,) {final _that = this;
switch (_that) {
case _QrModel():
return $default(_that.id,_that.content,_that.originalContent,_that.decoration,_that.version,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? content,  String? originalContent,  QrDecoration decoration,  int version,  QrType type)?  $default,) {final _that = this;
switch (_that) {
case _QrModel() when $default != null:
return $default(_that.id,_that.content,_that.originalContent,_that.decoration,_that.version,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrModel extends QrModel {
   _QrModel({required this.id, this.content, this.originalContent, this.decoration = const QrDecoration(), this.version = -1, this.type = QrType.create}): super._();
  factory _QrModel.fromJson(Map<String, dynamic> json) => _$QrModelFromJson(json);

@override final  String id;
@override final  String? content;
@override final  String? originalContent;
@override@JsonKey() final  QrDecoration decoration;
@override@JsonKey() final  int version;
@override@JsonKey() final  QrType type;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrModelCopyWith<_QrModel> get copyWith => __$QrModelCopyWithImpl<_QrModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.originalContent, originalContent) || other.originalContent == originalContent)&&(identical(other.decoration, decoration) || other.decoration == decoration)&&(identical(other.version, version) || other.version == version)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,originalContent,decoration,version,type);

@override
String toString() {
  return 'QrModel(id: $id, content: $content, originalContent: $originalContent, decoration: $decoration, version: $version, type: $type)';
}


}

/// @nodoc
abstract mixin class _$QrModelCopyWith<$Res> implements $QrModelCopyWith<$Res> {
  factory _$QrModelCopyWith(_QrModel value, $Res Function(_QrModel) _then) = __$QrModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? content, String? originalContent, QrDecoration decoration, int version, QrType type
});


@override $QrDecorationCopyWith<$Res> get decoration;

}
/// @nodoc
class __$QrModelCopyWithImpl<$Res>
    implements _$QrModelCopyWith<$Res> {
  __$QrModelCopyWithImpl(this._self, this._then);

  final _QrModel _self;
  final $Res Function(_QrModel) _then;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = freezed,Object? originalContent = freezed,Object? decoration = null,Object? version = null,Object? type = null,}) {
  return _then(_QrModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,originalContent: freezed == originalContent ? _self.originalContent : originalContent // ignore: cast_nullable_to_non_nullable
as String?,decoration: null == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as QrDecoration,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QrType,
  ));
}

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrDecorationCopyWith<$Res> get decoration {
  
  return $QrDecorationCopyWith<$Res>(_self.decoration, (value) {
    return _then(_self.copyWith(decoration: value));
  });
}
}

// dart format on
