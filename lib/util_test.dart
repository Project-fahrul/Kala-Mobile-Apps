import 'package:customer_retention/model/dao/customer_response.dart';
import 'package:customer_retention/model/dao/evidance_response.dart';
import 'package:customer_retention/model/evidance_model.dart';

class UtilTest {
  static EvidanceResponse getEvidanceResponse() {
    return EvidanceResponse(evidances: [
      EvidanceModel(
          customerName: "H. TALLASA",
          evidanceType: "Service",
          deadLine: DateTime.parse("2023-03-27"),
          isUploaded: 0,
          customerId: 1),
      EvidanceModel(
          customerName: "KEMENTERIAN AGAMA KAB. BANTAENG",
          evidanceType: "Service",
          deadLine: DateTime.parse("2023-03-27"),
          isUploaded: 0,
          customerId: 1),
      EvidanceModel(
          customerName: "A basran tahir",
          evidanceType: "Service",
          deadLine: DateTime.parse("2023-03-27"),
          isUploaded: 0,
          customerId: 1),
      EvidanceModel(
          customerName: "A. Ainun maqshuroh",
          evidanceType: "Service",
          deadLine: DateTime.parse("2023-03-27"),
          isUploaded: 0,
          customerId: 1),
      EvidanceModel(
          customerName: "A. Akbar Tanjung",
          evidanceType: "Service",
          deadLine: DateTime.parse("2023-03-27"),
          isUploaded: 0,
          customerId: 1),
    ], progress: 40);
  }

  List<CustomerResponse> getCustomerResponse() {
    return [
      CustomerResponse(
          id: 0,
          customerName: " H. TALLASA",
          address: "BONTO RITA",
          phoneNumber: "082215865723",
          noRangka: "MHKE8FA3JNK074528",
          tipeKendaraan: "NEW RUSH 1.5 S M/T GR SPORT",
          leasing: "-",
          totalAngsuran: 0,
          tipeAngsuran: "Tunai",
          tglLahir: DateTime.now(),
          tglService: DateTime.now(),
          tglStnk: DateTime.now(),
          tglAngsuran: DateTime.now())
    ];
  }
}
