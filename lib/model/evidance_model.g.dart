// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EvidanceModel _$$_EvidanceModelFromJson(Map<String, dynamic> json) =>
    _$_EvidanceModel(
      customerName: json['customerName'] as String,
      evidanceType: json['evidanceType'] as String,
      deadLine: DateTime.parse(json['deadLine'] as String),
      isUploaded: json['isUploaded'] as bool,
    );

Map<String, dynamic> _$$_EvidanceModelToJson(_$_EvidanceModel instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'evidanceType': instance.evidanceType,
      'deadLine': instance.deadLine.toIso8601String(),
      'isUploaded': instance.isUploaded,
    };
