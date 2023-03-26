// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evidance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EvidanceResponse _$EvidanceResponseFromJson(Map<String, dynamic> json) {
  return _EvidanceResponse.fromJson(json);
}

/// @nodoc
mixin _$EvidanceResponse {
  List<EvidanceModel> get evidances => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvidanceResponseCopyWith<EvidanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvidanceResponseCopyWith<$Res> {
  factory $EvidanceResponseCopyWith(
          EvidanceResponse value, $Res Function(EvidanceResponse) then) =
      _$EvidanceResponseCopyWithImpl<$Res, EvidanceResponse>;
  @useResult
  $Res call({List<EvidanceModel> evidances, int progress});
}

/// @nodoc
class _$EvidanceResponseCopyWithImpl<$Res, $Val extends EvidanceResponse>
    implements $EvidanceResponseCopyWith<$Res> {
  _$EvidanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evidances = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      evidances: null == evidances
          ? _value.evidances
          : evidances // ignore: cast_nullable_to_non_nullable
              as List<EvidanceModel>,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EvidanceResponseCopyWith<$Res>
    implements $EvidanceResponseCopyWith<$Res> {
  factory _$$_EvidanceResponseCopyWith(
          _$_EvidanceResponse value, $Res Function(_$_EvidanceResponse) then) =
      __$$_EvidanceResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EvidanceModel> evidances, int progress});
}

/// @nodoc
class __$$_EvidanceResponseCopyWithImpl<$Res>
    extends _$EvidanceResponseCopyWithImpl<$Res, _$_EvidanceResponse>
    implements _$$_EvidanceResponseCopyWith<$Res> {
  __$$_EvidanceResponseCopyWithImpl(
      _$_EvidanceResponse _value, $Res Function(_$_EvidanceResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evidances = null,
    Object? progress = null,
  }) {
    return _then(_$_EvidanceResponse(
      evidances: null == evidances
          ? _value._evidances
          : evidances // ignore: cast_nullable_to_non_nullable
              as List<EvidanceModel>,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EvidanceResponse implements _EvidanceResponse {
  const _$_EvidanceResponse(
      {required final List<EvidanceModel> evidances, required this.progress})
      : _evidances = evidances;

  factory _$_EvidanceResponse.fromJson(Map<String, dynamic> json) =>
      _$$_EvidanceResponseFromJson(json);

  final List<EvidanceModel> _evidances;
  @override
  List<EvidanceModel> get evidances {
    if (_evidances is EqualUnmodifiableListView) return _evidances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidances);
  }

  @override
  final int progress;

  @override
  String toString() {
    return 'EvidanceResponse(evidances: $evidances, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EvidanceResponse &&
            const DeepCollectionEquality()
                .equals(other._evidances, _evidances) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_evidances), progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EvidanceResponseCopyWith<_$_EvidanceResponse> get copyWith =>
      __$$_EvidanceResponseCopyWithImpl<_$_EvidanceResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvidanceResponseToJson(
      this,
    );
  }
}

abstract class _EvidanceResponse implements EvidanceResponse {
  const factory _EvidanceResponse(
      {required final List<EvidanceModel> evidances,
      required final int progress}) = _$_EvidanceResponse;

  factory _EvidanceResponse.fromJson(Map<String, dynamic> json) =
      _$_EvidanceResponse.fromJson;

  @override
  List<EvidanceModel> get evidances;
  @override
  int get progress;
  @override
  @JsonKey(ignore: true)
  _$$_EvidanceResponseCopyWith<_$_EvidanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
