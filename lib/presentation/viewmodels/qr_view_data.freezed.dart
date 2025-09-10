// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrViewData {

 String get id; QrModel get model; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of QrViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrViewDataCopyWith<QrViewData> get copyWith => _$QrViewDataCopyWithImpl<QrViewData>(this as QrViewData, _$identity);

  /// Serializes this QrViewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrViewData&&(identical(other.id, id) || other.id == id)&&(identical(other.model, model) || other.model == model)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,model,createdAt,updatedAt);

@override
String toString() {
  return 'QrViewData(id: $id, model: $model, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $QrViewDataCopyWith<$Res>  {
  factory $QrViewDataCopyWith(QrViewData value, $Res Function(QrViewData) _then) = _$QrViewDataCopyWithImpl;
@useResult
$Res call({
 String id, QrModel model, DateTime createdAt, DateTime updatedAt
});


$QrModelCopyWith<$Res> get model;

}
/// @nodoc
class _$QrViewDataCopyWithImpl<$Res>
    implements $QrViewDataCopyWith<$Res> {
  _$QrViewDataCopyWithImpl(this._self, this._then);

  final QrViewData _self;
  final $Res Function(QrViewData) _then;

/// Create a copy of QrViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? model = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as QrModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of QrViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrModelCopyWith<$Res> get model {
  
  return $QrModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}


/// Adds pattern-matching-related methods to [QrViewData].
extension QrViewDataPatterns on QrViewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrViewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrViewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrViewData value)  $default,){
final _that = this;
switch (_that) {
case _QrViewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrViewData value)?  $default,){
final _that = this;
switch (_that) {
case _QrViewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  QrModel model,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrViewData() when $default != null:
return $default(_that.id,_that.model,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  QrModel model,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _QrViewData():
return $default(_that.id,_that.model,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  QrModel model,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _QrViewData() when $default != null:
return $default(_that.id,_that.model,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrViewData implements QrViewData {
  const _QrViewData({required this.id, required this.model, required this.createdAt, required this.updatedAt});
  factory _QrViewData.fromJson(Map<String, dynamic> json) => _$QrViewDataFromJson(json);

@override final  String id;
@override final  QrModel model;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of QrViewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrViewDataCopyWith<_QrViewData> get copyWith => __$QrViewDataCopyWithImpl<_QrViewData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrViewDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrViewData&&(identical(other.id, id) || other.id == id)&&(identical(other.model, model) || other.model == model)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,model,createdAt,updatedAt);

@override
String toString() {
  return 'QrViewData(id: $id, model: $model, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$QrViewDataCopyWith<$Res> implements $QrViewDataCopyWith<$Res> {
  factory _$QrViewDataCopyWith(_QrViewData value, $Res Function(_QrViewData) _then) = __$QrViewDataCopyWithImpl;
@override @useResult
$Res call({
 String id, QrModel model, DateTime createdAt, DateTime updatedAt
});


@override $QrModelCopyWith<$Res> get model;

}
/// @nodoc
class __$QrViewDataCopyWithImpl<$Res>
    implements _$QrViewDataCopyWith<$Res> {
  __$QrViewDataCopyWithImpl(this._self, this._then);

  final _QrViewData _self;
  final $Res Function(_QrViewData) _then;

/// Create a copy of QrViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? model = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_QrViewData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as QrModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of QrViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrModelCopyWith<$Res> get model {
  
  return $QrModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}

// dart format on
