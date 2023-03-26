// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerResponse _$$_CustomerResponseFromJson(Map<String, dynamic> json) =>
    _$_CustomerResponse(
      customerName: json['customerName'] as String,
      id: json['id'] as int,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      noRangka: json['noRangka'] as String,
      tipeKendaraan: json['tipeKendaraan'] as String,
      leasing: json['leasing'] as String,
      totalAngsuran: json['totalAngsuran'] as int,
      tipeAngsuran: json['tipeAngsuran'] as String,
      tglLahir: DateTime.parse(json['tglLahir'] as String),
      tglService: DateTime.parse(json['tglService'] as String),
      tglStnk: DateTime.parse(json['tglStnk'] as String),
      tglAngsuran: DateTime.parse(json['tglAngsuran'] as String),
    );

Map<String, dynamic> _$$_CustomerResponseToJson(_$_CustomerResponse instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'id': instance.id,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'noRangka': instance.noRangka,
      'tipeKendaraan': instance.tipeKendaraan,
      'leasing': instance.leasing,
      'totalAngsuran': instance.totalAngsuran,
      'tipeAngsuran': instance.tipeAngsuran,
      'tglLahir': instance.tglLahir.toIso8601String(),
      'tglService': instance.tglService.toIso8601String(),
      'tglStnk': instance.tglStnk.toIso8601String(),
      'tglAngsuran': instance.tglAngsuran.toIso8601String(),
    };
