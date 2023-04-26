// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kendaraan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KendaraanModel _$KendaraanModelFromJson(Map<String, dynamic> json) {
  return _KendaraanModel.fromJson(json);
}

/// @nodoc
mixin _$KendaraanModel {
  String get tipeKendaraan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KendaraanModelCopyWith<KendaraanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KendaraanModelCopyWith<$Res> {
  factory $KendaraanModelCopyWith(
          KendaraanModel value, $Res Function(KendaraanModel) then) =
      _$KendaraanModelCopyWithImpl<$Res, KendaraanModel>;
  @useResult
  $Res call({String tipeKendaraan});
}

/// @nodoc
class _$KendaraanModelCopyWithImpl<$Res, $Val extends KendaraanModel>
    implements $KendaraanModelCopyWith<$Res> {
  _$KendaraanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipeKendaraan = null,
  }) {
    return _then(_value.copyWith(
      tipeKendaraan: null == tipeKendaraan
          ? _value.tipeKendaraan
          : tipeKendaraan // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KendaraanModelCopyWith<$Res>
    implements $KendaraanModelCopyWith<$Res> {
  factory _$$_KendaraanModelCopyWith(
          _$_KendaraanModel value, $Res Function(_$_KendaraanModel) then) =
      __$$_KendaraanModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tipeKendaraan});
}

/// @nodoc
class __$$_KendaraanModelCopyWithImpl<$Res>
    extends _$KendaraanModelCopyWithImpl<$Res, _$_KendaraanModel>
    implements _$$_KendaraanModelCopyWith<$Res> {
  __$$_KendaraanModelCopyWithImpl(
      _$_KendaraanModel _value, $Res Function(_$_KendaraanModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipeKendaraan = null,
  }) {
    return _then(_$_KendaraanModel(
      tipeKendaraan: null == tipeKendaraan
          ? _value.tipeKendaraan
          : tipeKendaraan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KendaraanModel implements _KendaraanModel {
  _$_KendaraanModel({required this.tipeKendaraan});

  factory _$_KendaraanModel.fromJson(Map<String, dynamic> json) =>
      _$$_KendaraanModelFromJson(json);

  @override
  final String tipeKendaraan;

  @override
  String toString() {
    return 'KendaraanModel(tipeKendaraan: $tipeKendaraan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KendaraanModel &&
            (identical(other.tipeKendaraan, tipeKendaraan) ||
                other.tipeKendaraan == tipeKendaraan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tipeKendaraan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KendaraanModelCopyWith<_$_KendaraanModel> get copyWith =>
      __$$_KendaraanModelCopyWithImpl<_$_KendaraanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KendaraanModelToJson(
      this,
    );
  }
}

abstract class _KendaraanModel implements KendaraanModel {
  factory _KendaraanModel({required final String tipeKendaraan}) =
      _$_KendaraanModel;

  factory _KendaraanModel.fromJson(Map<String, dynamic> json) =
      _$_KendaraanModel.fromJson;

  @override
  String get tipeKendaraan;
  @override
  @JsonKey(ignore: true)
  _$$_KendaraanModelCopyWith<_$_KendaraanModel> get copyWith =>
      throw _privateConstructorUsedError;
}
