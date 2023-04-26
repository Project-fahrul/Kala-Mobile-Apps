import 'dart:convert';
import 'dart:io';

import 'package:customer_retention/config/constant.dart';
import 'package:customer_retention/helper/rest_exception.dart';
import 'package:customer_retention/model/dao/error_response.dart';
import 'package:customer_retention/model/dao/evidance_response.dart';
import 'package:customer_retention/model/evidance_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class EvidanceApi {
  static Future<EvidanceResponse> getEvidance(String token) async {
    print("get evidance");
    final response = await http.get(
        Uri.parse(Constant.baseUrl + "/api/sales_evidance"),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        });

    print(response.body);
    if (response.statusCode == 200) {
      return EvidanceResponse.fromJson(jsonDecode(response.body));
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<bool> postEvidance(
      String token, XFile file, EvidanceModel model, String pesan) async {
    var headers = {'AUTHENTICATION': token};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constant.baseUrl}/api/sales_evidance'));
    request.files.add(await http.MultipartFile.fromBytes(
        'async-upload', File(file.path).readAsBytesSync(),
        filename: file.path));
    request.fields.addAll({
      'customerId': model.customerId.toString(),
      "pesan": pesan,
      "deadLine":
          "${model.deadLine.year}-${model.deadLine.month}-${model.deadLine.day}",
      "typeEvidance": model.evidanceType
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print(await response.stream.bytesToString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
