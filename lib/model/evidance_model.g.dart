// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EvidanceModel _$$_EvidanceModelFromJson(Map<String, dynamic> json) =>
    _$_EvidanceModel(
      customerName: json['customerName'] as String,
      customerId: json['customerId'] as int,
      evidanceType: json['evidanceType'] as String,
      deadLine: DateTime.parse(json['deadLine'] as String),
      comment: json['comment'] as String? ?? "",
      content: json['content'] as String? ?? "",
      pesan: json['pesan'] as String?,
      isUploaded: json['isUploaded'] as int,
    );

Map<String, dynamic> _$$_EvidanceModelToJson(_$_EvidanceModel instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'customerId': instance.customerId,
      'evidanceType': instance.evidanceType,
      'deadLine': instance.deadLine.toIso8601String(),
      'comment': instance.comment,
      'content': instance.content,
      'pesan': instance.pesan,
      'isUploaded': instance.isUploaded,
    };
