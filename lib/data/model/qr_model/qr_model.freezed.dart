// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrModel {

 String? get content; set content(String? value); String? get originalContent; set originalContent(String? value); MyQrEyeStyle get eyeStyle; set eyeStyle(MyQrEyeStyle value); MyQrModuleStyle get moduleStyle; set moduleStyle(MyQrModuleStyle value);@ColorConverter() Color get backgroundColor;@ColorConverter() set backgroundColor(Color value); int get version; set version(int value); QrType get type; set type(QrType value);
/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrModelCopyWith<QrModel> get copyWith => _$QrModelCopyWithImpl<QrModel>(this as QrModel, _$identity);

  /// Serializes this QrModel to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'QrModel(content: $content, originalContent: $originalContent, eyeStyle: $eyeStyle, moduleStyle: $moduleStyle, backgroundColor: $backgroundColor, version: $version, type: $type)';
}


}

/// @nodoc
abstract mixin class $QrModelCopyWith<$Res>  {
  factory $QrModelCopyWith(QrModel value, $Res Function(QrModel) _then) = _$QrModelCopyWithImpl;
@useResult
$Res call({
 String? content, String? originalContent, MyQrEyeStyle eyeStyle, MyQrModuleStyle moduleStyle,@ColorConverter() Color backgroundColor, int version, QrType type
});


$MyQrEyeStyleCopyWith<$Res> get eyeStyle;$MyQrModuleStyleCopyWith<$Res> get moduleStyle;

}
/// @nodoc
class _$QrModelCopyWithImpl<$Res>
    implements $QrModelCopyWith<$Res> {
  _$QrModelCopyWithImpl(this._self, this._then);

  final QrModel _self;
  final $Res Function(QrModel) _then;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = freezed,Object? originalContent = freezed,Object? eyeStyle = null,Object? moduleStyle = null,Object? backgroundColor = null,Object? version = null,Object? type = null,}) {
  return _then(_self.copyWith(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,originalContent: freezed == originalContent ? _self.originalContent : originalContent // ignore: cast_nullable_to_non_nullable
as String?,eyeStyle: null == eyeStyle ? _self.eyeStyle : eyeStyle // ignore: cast_nullable_to_non_nullable
as MyQrEyeStyle,moduleStyle: null == moduleStyle ? _self.moduleStyle : moduleStyle // ignore: cast_nullable_to_non_nullable
as MyQrModuleStyle,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QrType,
  ));
}
/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyQrEyeStyleCopyWith<$Res> get eyeStyle {
  
  return $MyQrEyeStyleCopyWith<$Res>(_self.eyeStyle, (value) {
    return _then(_self.copyWith(eyeStyle: value));
  });
}/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyQrModuleStyleCopyWith<$Res> get moduleStyle {
  
  return $MyQrModuleStyleCopyWith<$Res>(_self.moduleStyle, (value) {
    return _then(_self.copyWith(moduleStyle: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? content,  String? originalContent,  MyQrEyeStyle eyeStyle,  MyQrModuleStyle moduleStyle, @ColorConverter()  Color backgroundColor,  int version,  QrType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrModel() when $default != null:
return $default(_that.content,_that.originalContent,_that.eyeStyle,_that.moduleStyle,_that.backgroundColor,_that.version,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? content,  String? originalContent,  MyQrEyeStyle eyeStyle,  MyQrModuleStyle moduleStyle, @ColorConverter()  Color backgroundColor,  int version,  QrType type)  $default,) {final _that = this;
switch (_that) {
case _QrModel():
return $default(_that.content,_that.originalContent,_that.eyeStyle,_that.moduleStyle,_that.backgroundColor,_that.version,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? content,  String? originalContent,  MyQrEyeStyle eyeStyle,  MyQrModuleStyle moduleStyle, @ColorConverter()  Color backgroundColor,  int version,  QrType type)?  $default,) {final _that = this;
switch (_that) {
case _QrModel() when $default != null:
return $default(_that.content,_that.originalContent,_that.eyeStyle,_that.moduleStyle,_that.backgroundColor,_that.version,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrModel extends QrModel {
   _QrModel({this.content, this.originalContent, this.eyeStyle = _defaultEyeStyle, this.moduleStyle = _defaultModuleStyle, @ColorConverter() this.backgroundColor = Colors.blueAccent, this.version = -1, this.type = QrType.create}): super._();
  factory _QrModel.fromJson(Map<String, dynamic> json) => _$QrModelFromJson(json);

@override  String? content;
@override  String? originalContent;
@override@JsonKey()  MyQrEyeStyle eyeStyle;
@override@JsonKey()  MyQrModuleStyle moduleStyle;
@override@JsonKey()@ColorConverter()  Color backgroundColor;
@override@JsonKey()  int version;
@override@JsonKey()  QrType type;

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
String toString() {
  return 'QrModel(content: $content, originalContent: $originalContent, eyeStyle: $eyeStyle, moduleStyle: $moduleStyle, backgroundColor: $backgroundColor, version: $version, type: $type)';
}


}

/// @nodoc
abstract mixin class _$QrModelCopyWith<$Res> implements $QrModelCopyWith<$Res> {
  factory _$QrModelCopyWith(_QrModel value, $Res Function(_QrModel) _then) = __$QrModelCopyWithImpl;
@override @useResult
$Res call({
 String? content, String? originalContent, MyQrEyeStyle eyeStyle, MyQrModuleStyle moduleStyle,@ColorConverter() Color backgroundColor, int version, QrType type
});


@override $MyQrEyeStyleCopyWith<$Res> get eyeStyle;@override $MyQrModuleStyleCopyWith<$Res> get moduleStyle;

}
/// @nodoc
class __$QrModelCopyWithImpl<$Res>
    implements _$QrModelCopyWith<$Res> {
  __$QrModelCopyWithImpl(this._self, this._then);

  final _QrModel _self;
  final $Res Function(_QrModel) _then;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = freezed,Object? originalContent = freezed,Object? eyeStyle = null,Object? moduleStyle = null,Object? backgroundColor = null,Object? version = null,Object? type = null,}) {
  return _then(_QrModel(
content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,originalContent: freezed == originalContent ? _self.originalContent : originalContent // ignore: cast_nullable_to_non_nullable
as String?,eyeStyle: null == eyeStyle ? _self.eyeStyle : eyeStyle // ignore: cast_nullable_to_non_nullable
as MyQrEyeStyle,moduleStyle: null == moduleStyle ? _self.moduleStyle : moduleStyle // ignore: cast_nullable_to_non_nullable
as MyQrModuleStyle,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QrType,
  ));
}

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyQrEyeStyleCopyWith<$Res> get eyeStyle {
  
  return $MyQrEyeStyleCopyWith<$Res>(_self.eyeStyle, (value) {
    return _then(_self.copyWith(eyeStyle: value));
  });
}/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyQrModuleStyleCopyWith<$Res> get moduleStyle {
  
  return $MyQrModuleStyleCopyWith<$Res>(_self.moduleStyle, (value) {
    return _then(_self.copyWith(moduleStyle: value));
  });
}
}


/// @nodoc
mixin _$MyQrEyeStyle {

 EyeType get shape;@ColorConverter() Color get color;
/// Create a copy of MyQrEyeStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyQrEyeStyleCopyWith<MyQrEyeStyle> get copyWith => _$MyQrEyeStyleCopyWithImpl<MyQrEyeStyle>(this as MyQrEyeStyle, _$identity);

  /// Serializes this MyQrEyeStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyQrEyeStyle&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shape,color);

@override
String toString() {
  return 'MyQrEyeStyle(shape: $shape, color: $color)';
}


}

/// @nodoc
abstract mixin class $MyQrEyeStyleCopyWith<$Res>  {
  factory $MyQrEyeStyleCopyWith(MyQrEyeStyle value, $Res Function(MyQrEyeStyle) _then) = _$MyQrEyeStyleCopyWithImpl;
@useResult
$Res call({
 EyeType shape,@ColorConverter() Color color
});




}
/// @nodoc
class _$MyQrEyeStyleCopyWithImpl<$Res>
    implements $MyQrEyeStyleCopyWith<$Res> {
  _$MyQrEyeStyleCopyWithImpl(this._self, this._then);

  final MyQrEyeStyle _self;
  final $Res Function(MyQrEyeStyle) _then;

/// Create a copy of MyQrEyeStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shape = null,Object? color = null,}) {
  return _then(_self.copyWith(
shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as EyeType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [MyQrEyeStyle].
extension MyQrEyeStylePatterns on MyQrEyeStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyQrEyeStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyQrEyeStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyQrEyeStyle value)  $default,){
final _that = this;
switch (_that) {
case _MyQrEyeStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyQrEyeStyle value)?  $default,){
final _that = this;
switch (_that) {
case _MyQrEyeStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EyeType shape, @ColorConverter()  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyQrEyeStyle() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EyeType shape, @ColorConverter()  Color color)  $default,) {final _that = this;
switch (_that) {
case _MyQrEyeStyle():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EyeType shape, @ColorConverter()  Color color)?  $default,) {final _that = this;
switch (_that) {
case _MyQrEyeStyle() when $default != null:
return $default(_that.shape,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyQrEyeStyle extends MyQrEyeStyle {
  const _MyQrEyeStyle({this.shape = EyeType.square, @ColorConverter() this.color = _defaultEyeColor}): super._();
  factory _MyQrEyeStyle.fromJson(Map<String, dynamic> json) => _$MyQrEyeStyleFromJson(json);

@override@JsonKey() final  EyeType shape;
@override@JsonKey()@ColorConverter() final  Color color;

/// Create a copy of MyQrEyeStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyQrEyeStyleCopyWith<_MyQrEyeStyle> get copyWith => __$MyQrEyeStyleCopyWithImpl<_MyQrEyeStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyQrEyeStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyQrEyeStyle&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shape,color);

@override
String toString() {
  return 'MyQrEyeStyle(shape: $shape, color: $color)';
}


}

/// @nodoc
abstract mixin class _$MyQrEyeStyleCopyWith<$Res> implements $MyQrEyeStyleCopyWith<$Res> {
  factory _$MyQrEyeStyleCopyWith(_MyQrEyeStyle value, $Res Function(_MyQrEyeStyle) _then) = __$MyQrEyeStyleCopyWithImpl;
@override @useResult
$Res call({
 EyeType shape,@ColorConverter() Color color
});




}
/// @nodoc
class __$MyQrEyeStyleCopyWithImpl<$Res>
    implements _$MyQrEyeStyleCopyWith<$Res> {
  __$MyQrEyeStyleCopyWithImpl(this._self, this._then);

  final _MyQrEyeStyle _self;
  final $Res Function(_MyQrEyeStyle) _then;

/// Create a copy of MyQrEyeStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shape = null,Object? color = null,}) {
  return _then(_MyQrEyeStyle(
shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as EyeType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}


/// @nodoc
mixin _$MyQrModuleStyle {

 ModuleType get shape;@ColorConverter() Color get color;
/// Create a copy of MyQrModuleStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyQrModuleStyleCopyWith<MyQrModuleStyle> get copyWith => _$MyQrModuleStyleCopyWithImpl<MyQrModuleStyle>(this as MyQrModuleStyle, _$identity);

  /// Serializes this MyQrModuleStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyQrModuleStyle&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shape,color);

@override
String toString() {
  return 'MyQrModuleStyle(shape: $shape, color: $color)';
}


}

/// @nodoc
abstract mixin class $MyQrModuleStyleCopyWith<$Res>  {
  factory $MyQrModuleStyleCopyWith(MyQrModuleStyle value, $Res Function(MyQrModuleStyle) _then) = _$MyQrModuleStyleCopyWithImpl;
@useResult
$Res call({
 ModuleType shape,@ColorConverter() Color color
});




}
/// @nodoc
class _$MyQrModuleStyleCopyWithImpl<$Res>
    implements $MyQrModuleStyleCopyWith<$Res> {
  _$MyQrModuleStyleCopyWithImpl(this._self, this._then);

  final MyQrModuleStyle _self;
  final $Res Function(MyQrModuleStyle) _then;

/// Create a copy of MyQrModuleStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shape = null,Object? color = null,}) {
  return _then(_self.copyWith(
shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as ModuleType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [MyQrModuleStyle].
extension MyQrModuleStylePatterns on MyQrModuleStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyQrModuleStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyQrModuleStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyQrModuleStyle value)  $default,){
final _that = this;
switch (_that) {
case _MyQrModuleStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyQrModuleStyle value)?  $default,){
final _that = this;
switch (_that) {
case _MyQrModuleStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ModuleType shape, @ColorConverter()  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyQrModuleStyle() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ModuleType shape, @ColorConverter()  Color color)  $default,) {final _that = this;
switch (_that) {
case _MyQrModuleStyle():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ModuleType shape, @ColorConverter()  Color color)?  $default,) {final _that = this;
switch (_that) {
case _MyQrModuleStyle() when $default != null:
return $default(_that.shape,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyQrModuleStyle extends MyQrModuleStyle {
  const _MyQrModuleStyle({this.shape = ModuleType.square, @ColorConverter() this.color = _defaultModuleColor}): super._();
  factory _MyQrModuleStyle.fromJson(Map<String, dynamic> json) => _$MyQrModuleStyleFromJson(json);

@override@JsonKey() final  ModuleType shape;
@override@JsonKey()@ColorConverter() final  Color color;

/// Create a copy of MyQrModuleStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyQrModuleStyleCopyWith<_MyQrModuleStyle> get copyWith => __$MyQrModuleStyleCopyWithImpl<_MyQrModuleStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyQrModuleStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyQrModuleStyle&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shape,color);

@override
String toString() {
  return 'MyQrModuleStyle(shape: $shape, color: $color)';
}


}

/// @nodoc
abstract mixin class _$MyQrModuleStyleCopyWith<$Res> implements $MyQrModuleStyleCopyWith<$Res> {
  factory _$MyQrModuleStyleCopyWith(_MyQrModuleStyle value, $Res Function(_MyQrModuleStyle) _then) = __$MyQrModuleStyleCopyWithImpl;
@override @useResult
$Res call({
 ModuleType shape,@ColorConverter() Color color
});




}
/// @nodoc
class __$MyQrModuleStyleCopyWithImpl<$Res>
    implements _$MyQrModuleStyleCopyWith<$Res> {
  __$MyQrModuleStyleCopyWithImpl(this._self, this._then);

  final _MyQrModuleStyle _self;
  final $Res Function(_MyQrModuleStyle) _then;

/// Create a copy of MyQrModuleStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shape = null,Object? color = null,}) {
  return _then(_MyQrModuleStyle(
shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as ModuleType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
