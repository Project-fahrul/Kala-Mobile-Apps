import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_response.freezed.dart';
part 'customer_response.g.dart';

@unfreezed
class CustomerResponse with _$CustomerResponse {
  factory CustomerResponse(
      {required String customerName,
      required int id,
      required String address,
      required String phoneNumber,
      required String noRangka,
      required String tipeKendaraan,
      required String leasing,
      required int totalAngsuran,
      required String tipeAngsuran,
      required DateTime tglLahir,
      required DateTime tglService,
      required DateTime tglStnk,
      required DateTime tglAngsuran}) = _CustomerResponse;

  factory CustomerResponse.fromJson(Map<String, Object?> json) =>
      _$CustomerResponseFromJson(json);
}
