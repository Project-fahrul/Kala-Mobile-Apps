// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EvidanceResponse _$$_EvidanceResponseFromJson(Map<String, dynamic> json) =>
    _$_EvidanceResponse(
      evidances: (json['evidances'] as List<dynamic>)
          .map((e) => EvidanceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      progress: json['progress'] as int,
    );

Map<String, dynamic> _$$_EvidanceResponseToJson(_$_EvidanceResponse instance) =>
    <String, dynamic>{
      'evidances': instance.evidances,
      'progress': instance.progress,
    };
