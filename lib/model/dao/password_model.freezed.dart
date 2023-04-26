// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PasswordModel _$PasswordModelFromJson(Map<String, dynamic> json) {
  return _PasswordModel.fromJson(json);
}

/// @nodoc
mixin _$PasswordModel {
  int get status => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordModelCopyWith<PasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordModelCopyWith<$Res> {
  factory $PasswordModelCopyWith(
          PasswordModel value, $Res Function(PasswordModel) then) =
      _$PasswordModelCopyWithImpl<$Res, PasswordModel>;
  @useResult
  $Res call({int status, String error});
}

/// @nodoc
class _$PasswordModelCopyWithImpl<$Res, $Val extends PasswordModel>
    implements $PasswordModelCopyWith<$Res> {
  _$PasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordModelCopyWith<$Res>
    implements $PasswordModelCopyWith<$Res> {
  factory _$$_PasswordModelCopyWith(
          _$_PasswordModel value, $Res Function(_$_PasswordModel) then) =
      __$$_PasswordModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, String error});
}

/// @nodoc
class __$$_PasswordModelCopyWithImpl<$Res>
    extends _$PasswordModelCopyWithImpl<$Res, _$_PasswordModel>
    implements _$$_PasswordModelCopyWith<$Res> {
  __$$_PasswordModelCopyWithImpl(
      _$_PasswordModel _value, $Res Function(_$_PasswordModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = null,
  }) {
    return _then(_$_PasswordModel(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PasswordModel implements _PasswordModel {
  _$_PasswordModel({required this.status, required this.error});

  factory _$_PasswordModel.fromJson(Map<String, dynamic> json) =>
      _$$_PasswordModelFromJson(json);

  @override
  final int status;
  @override
  final String error;

  @override
  String toString() {
    return 'PasswordModel(status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordModelCopyWith<_$_PasswordModel> get copyWith =>
      __$$_PasswordModelCopyWithImpl<_$_PasswordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PasswordModelToJson(
      this,
    );
  }
}

abstract class _PasswordModel implements PasswordModel {
  factory _PasswordModel(
      {required final int status,
      required final String error}) = _$_PasswordModel;

  factory _PasswordModel.fromJson(Map<String, dynamic> json) =
      _$_PasswordModel.fromJson;

  @override
  int get status;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordModelCopyWith<_$_PasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}
