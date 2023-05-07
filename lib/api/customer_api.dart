import 'dart:convert';

import 'package:customer_retention/config/constant.dart';
import 'package:customer_retention/helper/rest_exception.dart';
import 'package:customer_retention/model/customer_regular_model.dart';
import 'package:customer_retention/model/customer_trust_model.dart';
import 'package:customer_retention/model/dao/customer_prospek_model.dart';
import 'package:customer_retention/model/dao/error_response.dart';
import 'package:customer_retention/model/list_response_http.dart';
import 'package:http/http.dart' as http;

class CustomerApi {
  static Future<ListResponse<CustomerRegularModel>> getCustomerRegular(
      String token) async {
    final response = await http.get(
        Uri.parse('${Constant.baseUrl}/api/customer_regular'),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        });
    if (response.statusCode == 200) {
      return ListResponse.fromJson(
          jsonDecode(response.body),
          (json) =>
              CustomerRegularModel.fromJson(json as Map<String, Object?>));
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<ListResponse<CustomerProspekModel>> getCustomerProspek(
      String token) async {
    final response = await http.get(
        Uri.parse('${Constant.baseUrl}/api/customer_prospek'),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        });
    if (response.statusCode == 200) {
      return ListResponse.fromJson(
          jsonDecode(response.body),
          (json) =>
              CustomerProspekModel.fromJson(json as Map<String, Object?>));
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<bool> saveCustomerRegular(
      String token, CustomerRegularModel model) async {
    final response =
        await http.post(Uri.parse('${Constant.baseUrl}/api/customer_regular'),
            headers: <String, String>{
              Constant.Media_Content_Type: Constant.Media_Type_JSON,
              Constant.AUTHENTICATION: token
            },
            body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return true;
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<bool> saveCustomerProspek(
      String token, CustomerProspekModel model) async {
    final response =
        await http.post(Uri.parse('${Constant.baseUrl}/api/customer_prospek'),
            headers: <String, String>{
              Constant.Media_Content_Type: Constant.Media_Type_JSON,
              Constant.AUTHENTICATION: token
            },
            body: jsonEncode(model.toJson()));
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<bool> saveCustomerTrust(
      String token, CustomerTrustModel model) async {
    final response =
        await http.post(Uri.parse('${Constant.baseUrl}/api/customer_trust'),
            headers: <String, String>{
              Constant.Media_Content_Type: Constant.Media_Type_JSON,
              Constant.AUTHENTICATION: token
            },
            body: jsonEncode(model.toJson()));
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<bool> editCustomerTrust(
      String token, CustomerTrustModel model) async {
    final response =
        await http.patch(Uri.parse('${Constant.baseUrl}/api/customer_trust'),
            headers: <String, String>{
              Constant.Media_Content_Type: Constant.Media_Type_JSON,
              Constant.AUTHENTICATION: token
            },
            body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return true;
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<bool> editCustomerRegular(
      String token, CustomerRegularModel model) async {
    final response =
        await http.patch(Uri.parse('${Constant.baseUrl}/api/customer_regular'),
            headers: <String, String>{
              Constant.Media_Content_Type: Constant.Media_Type_JSON,
              Constant.AUTHENTICATION: token
            },
            body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return true;
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<bool> editCustomerProspek(
      String token, CustomerProspekModel model) async {
    final response =
        await http.patch(Uri.parse('${Constant.baseUrl}/api/customer_prospek'),
            headers: <String, String>{
              Constant.Media_Content_Type: Constant.Media_Type_JSON,
              Constant.AUTHENTICATION: token
            },
            body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return true;
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<ListResponse<CustomerTrustModel>> getCustomerTrust(
      String token) async {
    final response = await http.get(
        Uri.parse('${Constant.baseUrl}/api/customer_trust'),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        });

    if (response.statusCode == 200) {
      return ListResponse.fromJson(jsonDecode(response.body),
          (json) => CustomerTrustModel.fromJson(json as Map<String, Object?>));
    }
    throw RestException(
        ErrorResponse.fromJson(jsonDecode(response.body)), response.statusCode);
  }

  static Future<bool> deleteCustomerProspek(int id, String token) async {
    final response = await http.delete(
        Uri.parse("${Constant.baseUrl}/api/customer_prospek?customerId=$id"),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        });
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> deleteCustomerTrust(int id, String token) async {
    final response = await http.delete(
        Uri.parse("${Constant.baseUrl}/api/customer_trust?customerId=$id"),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        });

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> deleteCustomerRegular(int id, String token) async {
    final response = await http.delete(
        Uri.parse("${Constant.baseUrl}/api/customer_regular?customerId=$id"),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        });

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
