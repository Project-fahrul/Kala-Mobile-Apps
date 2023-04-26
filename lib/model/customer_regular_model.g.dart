// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_regular_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerRegularModel _$$_CustomerRegularModelFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerRegularModel(
      name: json['name'] as String,
      address: json['address'] as String,
      noHp: json['noHp'] as String,
      salesId: json['salesId'] as int,
      tglStnk: DateTime.parse(json['tglStnk'] as String),
      tglLahir: DateTime.parse(json['tglLahir'] as String),
      tglDec: DateTime.parse(json['tglDec'] as String),
      tglAngsuran: DateTime.parse(json['tglAngsuran'] as String),
      typeAngsuran: json['typeAngsuran'] as String,
      noRangka: json['noRangka'] as String,
      typeKendaraan: json['typeKendaraan'] as String,
      leasing: json['leasing'] as String,
      totalAngsuran: json['totalAngsuran'] as int,
      customerId: json['customerId'] as int? ?? -1,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_CustomerRegularModelToJson(
        _$_CustomerRegularModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'noHp': instance.noHp,
      'salesId': instance.salesId,
      'tglStnk': instance.tglStnk.toIso8601String(),
      'tglLahir': instance.tglLahir.toIso8601String(),
      'tglDec': instance.tglDec.toIso8601String(),
      'tglAngsuran': instance.tglAngsuran.toIso8601String(),
      'typeAngsuran': instance.typeAngsuran,
      'noRangka': instance.noRangka,
      'typeKendaraan': instance.typeKendaraan,
      'leasing': instance.leasing,
      'totalAngsuran': instance.totalAngsuran,
      'customerId': instance.customerId,
      'id': instance.id,
    };
