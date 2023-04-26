import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_trust_model.freezed.dart';
part 'customer_trust_model.g.dart';

@unfreezed
class CustomerTrustModel with _$CustomerTrustModel {
  factory CustomerTrustModel({
    required int id,
    @Default(-1) int customerId,
    required String name,
    required String alamat,
    required String noHp,
    required String kendaraanSaatIni,
    required String tahun,
    required String jenisKendaraan,
    required String hargaTrust,
    required String hargaOlx,
    required String hargaCustomer,
    required String statusProspek,
    required String pembicaraan,
    required DateTime followUp,
    required String pembayaran,
  }) = _CustomerTrustModel;

  factory CustomerTrustModel.fromJson(Map<String, Object?> json) =>
      _$CustomerTrustModelFromJson(json);
}
