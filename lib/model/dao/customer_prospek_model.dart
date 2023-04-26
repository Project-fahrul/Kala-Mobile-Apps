import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_prospek_model.freezed.dart';
part 'customer_prospek_model.g.dart';

@unfreezed
class CustomerProspekModel with _$CustomerProspekModel {
  factory CustomerProspekModel(
      {@Default(-1) customerId,
      required int id,
      required String name,
      required String alamat,
      required String noHp,
      required String tipeKendaraan,
      required DateTime ulangTahun,
      required DateTime followUp,
      required String statusProspek,
      required String kendaraanSaatIni,
      required String pengeluaranCustomer,
      required String isiPembicaraan,
      required String penghasilanCustomer,
      required int jumlahPertemuan}) = _CustomerProspekModel;

  factory CustomerProspekModel.fromJson(Map<String, Object?> json) =>
      _$CustomerProspekModelFromJson(json);
}
