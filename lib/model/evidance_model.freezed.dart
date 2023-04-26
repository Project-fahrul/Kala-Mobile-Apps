// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evidance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EvidanceModel _$EvidanceModelFromJson(Map<String, dynamic> json) {
  return _EvidanceModel.fromJson(json);
}

/// @nodoc
mixin _$EvidanceModel {
  String get customerName => throw _privateConstructorUsedError;
  int get customerId => throw _privateConstructorUsedError;
  String get evidanceType => throw _privateConstructorUsedError;
  DateTime get deadLine => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get pesan => throw _privateConstructorUsedError;
  int get isUploaded => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvidanceModelCopyWith<EvidanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvidanceModelCopyWith<$Res> {
  factory $EvidanceModelCopyWith(
          EvidanceModel value, $Res Function(EvidanceModel) then) =
      _$EvidanceModelCopyWithImpl<$Res, EvidanceModel>;
  @useResult
  $Res call(
      {String customerName,
      int customerId,
      String evidanceType,
      DateTime deadLine,
      String comment,
      String content,
      String? pesan,
      int isUploaded});
}

/// @nodoc
class _$EvidanceModelCopyWithImpl<$Res, $Val extends EvidanceModel>
    implements $EvidanceModelCopyWith<$Res> {
  _$EvidanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? customerId = null,
    Object? evidanceType = null,
    Object? deadLine = null,
    Object? comment = null,
    Object? content = null,
    Object? pesan = freezed,
    Object? isUploaded = null,
  }) {
    return _then(_value.copyWith(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      evidanceType: null == evidanceType
          ? _value.evidanceType
          : evidanceType // ignore: cast_nullable_to_non_nullable
              as String,
      deadLine: null == deadLine
          ? _value.deadLine
          : deadLine // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      pesan: freezed == pesan
          ? _value.pesan
          : pesan // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _value.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EvidanceModelCopyWith<$Res>
    implements $EvidanceModelCopyWith<$Res> {
  factory _$$_EvidanceModelCopyWith(
          _$_EvidanceModel value, $Res Function(_$_EvidanceModel) then) =
      __$$_EvidanceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerName,
      int customerId,
      String evidanceType,
      DateTime deadLine,
      String comment,
      String content,
      String? pesan,
      int isUploaded});
}

/// @nodoc
class __$$_EvidanceModelCopyWithImpl<$Res>
    extends _$EvidanceModelCopyWithImpl<$Res, _$_EvidanceModel>
    implements _$$_EvidanceModelCopyWith<$Res> {
  __$$_EvidanceModelCopyWithImpl(
      _$_EvidanceModel _value, $Res Function(_$_EvidanceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? customerId = null,
    Object? evidanceType = null,
    Object? deadLine = null,
    Object? comment = null,
    Object? content = null,
    Object? pesan = freezed,
    Object? isUploaded = null,
  }) {
    return _then(_$_EvidanceModel(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      evidanceType: null == evidanceType
          ? _value.evidanceType
          : evidanceType // ignore: cast_nullable_to_non_nullable
              as String,
      deadLine: null == deadLine
          ? _value.deadLine
          : deadLine // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      pesan: freezed == pesan
          ? _value.pesan
          : pesan // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploaded: null == isUploaded
          ? _value.isUploaded
          : isUploaded // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EvidanceModel implements _EvidanceModel {
  const _$_EvidanceModel(
      {required this.customerName,
      required this.customerId,
      required this.evidanceType,
      required this.deadLine,
      this.comment = "",
      this.content = "",
      this.pesan,
      required this.isUploaded});

  factory _$_EvidanceModel.fromJson(Map<String, dynamic> json) =>
      _$$_EvidanceModelFromJson(json);

  @override
  final String customerName;
  @override
  final int customerId;
  @override
  final String evidanceType;
  @override
  final DateTime deadLine;
  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  final String content;
  @override
  final String? pesan;
  @override
  final int isUploaded;

  @override
  String toString() {
    return 'EvidanceModel(customerName: $customerName, customerId: $customerId, evidanceType: $evidanceType, deadLine: $deadLine, comment: $comment, content: $content, pesan: $pesan, isUploaded: $isUploaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EvidanceModel &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.evidanceType, evidanceType) ||
                other.evidanceType == evidanceType) &&
            (identical(other.deadLine, deadLine) ||
                other.deadLine == deadLine) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.pesan, pesan) || other.pesan == pesan) &&
            (identical(other.isUploaded, isUploaded) ||
                other.isUploaded == isUploaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customerName, customerId,
      evidanceType, deadLine, comment, content, pesan, isUploaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EvidanceModelCopyWith<_$_EvidanceModel> get copyWith =>
      __$$_EvidanceModelCopyWithImpl<_$_EvidanceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvidanceModelToJson(
      this,
    );
  }
}

abstract class _EvidanceModel implements EvidanceModel {
  const factory _EvidanceModel(
      {required final String customerName,
      required final int customerId,
      required final String evidanceType,
      required final DateTime deadLine,
      final String comment,
      final String content,
      final String? pesan,
      required final int isUploaded}) = _$_EvidanceModel;

  factory _EvidanceModel.fromJson(Map<String, dynamic> json) =
      _$_EvidanceModel.fromJson;

  @override
  String get customerName;
  @override
  int get customerId;
  @override
  String get evidanceType;
  @override
  DateTime get deadLine;
  @override
  String get comment;
  @override
  String get content;
  @override
  String? get pesan;
  @override
  int get isUploaded;
  @override
  @JsonKey(ignore: true)
  _$$_EvidanceModelCopyWith<_$_EvidanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
