// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyTokenResponse _$VerifyTokenResponseFromJson(Map<String, dynamic> json) {
  return _VerifyTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyTokenResponse {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyTokenResponseCopyWith<VerifyTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyTokenResponseCopyWith<$Res> {
  factory $VerifyTokenResponseCopyWith(
          VerifyTokenResponse value, $Res Function(VerifyTokenResponse) then) =
      _$VerifyTokenResponseCopyWithImpl<$Res, VerifyTokenResponse>;
  @useResult
  $Res call({String name, String phoneNumber, String email, int id});
}

/// @nodoc
class _$VerifyTokenResponseCopyWithImpl<$Res, $Val extends VerifyTokenResponse>
    implements $VerifyTokenResponseCopyWith<$Res> {
  _$VerifyTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerifyTokenResponseCopyWith<$Res>
    implements $VerifyTokenResponseCopyWith<$Res> {
  factory _$$_VerifyTokenResponseCopyWith(_$_VerifyTokenResponse value,
          $Res Function(_$_VerifyTokenResponse) then) =
      __$$_VerifyTokenResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phoneNumber, String email, int id});
}

/// @nodoc
class __$$_VerifyTokenResponseCopyWithImpl<$Res>
    extends _$VerifyTokenResponseCopyWithImpl<$Res, _$_VerifyTokenResponse>
    implements _$$_VerifyTokenResponseCopyWith<$Res> {
  __$$_VerifyTokenResponseCopyWithImpl(_$_VerifyTokenResponse _value,
      $Res Function(_$_VerifyTokenResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? id = null,
  }) {
    return _then(_$_VerifyTokenResponse(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifyTokenResponse implements _VerifyTokenResponse {
  _$_VerifyTokenResponse(
      {required this.name,
      required this.phoneNumber,
      required this.email,
      required this.id});

  factory _$_VerifyTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$$_VerifyTokenResponseFromJson(json);

  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final int id;

  @override
  String toString() {
    return 'VerifyTokenResponse(name: $name, phoneNumber: $phoneNumber, email: $email, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyTokenResponse &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber, email, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyTokenResponseCopyWith<_$_VerifyTokenResponse> get copyWith =>
      __$$_VerifyTokenResponseCopyWithImpl<_$_VerifyTokenResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerifyTokenResponseToJson(
      this,
    );
  }
}

abstract class _VerifyTokenResponse implements VerifyTokenResponse {
  factory _VerifyTokenResponse(
      {required final String name,
      required final String phoneNumber,
      required final String email,
      required final int id}) = _$_VerifyTokenResponse;

  factory _VerifyTokenResponse.fromJson(Map<String, dynamic> json) =
      _$_VerifyTokenResponse.fromJson;

  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_VerifyTokenResponseCopyWith<_$_VerifyTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
