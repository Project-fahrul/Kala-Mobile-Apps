import 'dart:convert';

import 'package:customer_retention/config/constant.dart';
import 'package:customer_retention/helper/rest_exception.dart';
import 'package:customer_retention/model/dao/error_response.dart';
import 'package:customer_retention/model/dao/kendaraan_model.dart';
import 'package:customer_retention/model/list_response_http.dart';

import 'package:http/http.dart' as http;

class KendaraanApi {
  static Future<ListResponse<KendaraanModel>> getKendaraan(String token) async {
    final response = await http.get(
        Uri.parse('${Constant.baseUrl}/api/kendaraan'),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        });
    if (response.statusCode == 200) {
      return ListResponse.fromJson(jsonDecode(response.body),
          (json) => KendaraanModel.fromJson(json as Map<String, Object?>));
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }
}
