// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_response_http.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListResponse<T> _$ListResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ListResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ListResponse<T> {
  List<T> get data => throw _privateConstructorUsedError;
  set data(List<T> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListResponseCopyWith<T, ListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListResponseCopyWith<T, $Res> {
  factory $ListResponseCopyWith(
          ListResponse<T> value, $Res Function(ListResponse<T>) then) =
      _$ListResponseCopyWithImpl<T, $Res, ListResponse<T>>;
  @useResult
  $Res call({List<T> data});
}

/// @nodoc
class _$ListResponseCopyWithImpl<T, $Res, $Val extends ListResponse<T>>
    implements $ListResponseCopyWith<T, $Res> {
  _$ListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListResponseCopyWith<T, $Res>
    implements $ListResponseCopyWith<T, $Res> {
  factory _$$_ListResponseCopyWith(
          _$_ListResponse<T> value, $Res Function(_$_ListResponse<T>) then) =
      __$$_ListResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> data});
}

/// @nodoc
class __$$_ListResponseCopyWithImpl<T, $Res>
    extends _$ListResponseCopyWithImpl<T, $Res, _$_ListResponse<T>>
    implements _$$_ListResponseCopyWith<T, $Res> {
  __$$_ListResponseCopyWithImpl(
      _$_ListResponse<T> _value, $Res Function(_$_ListResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_ListResponse<T>(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ListResponse<T> implements _ListResponse<T> {
  _$_ListResponse({required this.data});

  factory _$_ListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ListResponseFromJson(json, fromJsonT);

  @override
  List<T> data;

  @override
  String toString() {
    return 'ListResponse<$T>(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListResponseCopyWith<T, _$_ListResponse<T>> get copyWith =>
      __$$_ListResponseCopyWithImpl<T, _$_ListResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_ListResponseToJson<T>(this, toJsonT);
  }
}

abstract class _ListResponse<T> implements ListResponse<T> {
  factory _ListResponse({required List<T> data}) = _$_ListResponse<T>;

  factory _ListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ListResponse<T>.fromJson;

  @override
  List<T> get data;
  set data(List<T> value);
  @override
  @JsonKey(ignore: true)
  _$$_ListResponseCopyWith<T, _$_ListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
