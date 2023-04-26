// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerifyTokenResponse _$$_VerifyTokenResponseFromJson(
        Map<String, dynamic> json) =>
    _$_VerifyTokenResponse(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_VerifyTokenResponseToJson(
        _$_VerifyTokenResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'id': instance.id,
    };
