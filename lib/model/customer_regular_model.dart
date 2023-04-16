import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_regular_model.freezed.dart';

@unfreezed
class CustomerRegularModel with _$CustomerRegularModel {
  factory CustomerRegularModel({
    required String name,
    required String address,
    required String noHp,
    required int salesId,
    required DateTime tglStnk,
    required DateTime tglLahir,
    required DateTime tglDec,
    required DateTime tglAngsuran,
    required String typeAngsuran,
    required String noRangka,
    required String typeKendaraan,
    required String leasing,
    required int totalAngsuran,
  }) = _CustomerRegularModel;
}
