import 'dart:convert';

import 'package:customer_retention/config/constant.dart';
import 'package:http/http.dart' as http;

class ForgotpasswordApi {
  static Future<bool> verifyEmail(String email) async {
    final response = await http.post(
        Uri.parse('${Constant.baseUrl}/api/forgot'),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON
        },
        body: jsonEncode(<String, String>{"email": email}));

    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> changePassword(String code, String email) async {
    final response = await http.patch(Uri.parse('${Constant.baseUrl}/forgot'),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON
        },
        body: jsonEncode(<String, String>{
          "email": email,
          "code": code,
        }));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
