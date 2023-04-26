// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_trust_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerTrustModel _$$_CustomerTrustModelFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerTrustModel(
      id: json['id'] as int,
      customerId: json['customerId'] as int? ?? -1,
      name: json['name'] as String,
      alamat: json['alamat'] as String,
      noHp: json['noHp'] as String,
      kendaraanSaatIni: json['kendaraanSaatIni'] as String,
      tahun: json['tahun'] as String,
      jenisKendaraan: json['jenisKendaraan'] as String,
      hargaTrust: json['hargaTrust'] as String,
      hargaOlx: json['hargaOlx'] as String,
      hargaCustomer: json['hargaCustomer'] as String,
      statusProspek: json['statusProspek'] as String,
      pembicaraan: json['pembicaraan'] as String,
      followUp: DateTime.parse(json['followUp'] as String),
      pembayaran: json['pembayaran'] as String,
    );

Map<String, dynamic> _$$_CustomerTrustModelToJson(
        _$_CustomerTrustModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'name': instance.name,
      'alamat': instance.alamat,
      'noHp': instance.noHp,
      'kendaraanSaatIni': instance.kendaraanSaatIni,
      'tahun': instance.tahun,
      'jenisKendaraan': instance.jenisKendaraan,
      'hargaTrust': instance.hargaTrust,
      'hargaOlx': instance.hargaOlx,
      'hargaCustomer': instance.hargaCustomer,
      'statusProspek': instance.statusProspek,
      'pembicaraan': instance.pembicaraan,
      'followUp': instance.followUp.toIso8601String(),
      'pembayaran': instance.pembayaran,
    };
