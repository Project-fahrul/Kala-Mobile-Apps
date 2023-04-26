// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_prospek_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerProspekModel _$$_CustomerProspekModelFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerProspekModel(
      customerId: json['customerId'] ?? -1,
      id: json['id'] as int,
      name: json['name'] as String,
      alamat: json['alamat'] as String,
      noHp: json['noHp'] as String,
      tipeKendaraan: json['tipeKendaraan'] as String,
      ulangTahun: DateTime.parse(json['ulangTahun'] as String),
      followUp: DateTime.parse(json['followUp'] as String),
      statusProspek: json['statusProspek'] as String,
      kendaraanSaatIni: json['kendaraanSaatIni'] as String,
      pengeluaranCustomer: json['pengeluaranCustomer'] as String,
      isiPembicaraan: json['isiPembicaraan'] as String,
      penghasilanCustomer: json['penghasilanCustomer'] as String,
      jumlahPertemuan: json['jumlahPertemuan'] as int,
    );

Map<String, dynamic> _$$_CustomerProspekModelToJson(
        _$_CustomerProspekModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'id': instance.id,
      'name': instance.name,
      'alamat': instance.alamat,
      'noHp': instance.noHp,
      'tipeKendaraan': instance.tipeKendaraan,
      'ulangTahun': instance.ulangTahun.toIso8601String(),
      'followUp': instance.followUp.toIso8601String(),
      'statusProspek': instance.statusProspek,
      'kendaraanSaatIni': instance.kendaraanSaatIni,
      'pengeluaranCustomer': instance.pengeluaranCustomer,
      'isiPembicaraan': instance.isiPembicaraan,
      'penghasilanCustomer': instance.penghasilanCustomer,
      'jumlahPertemuan': instance.jumlahPertemuan,
    };
