import 'dart:convert';

import 'package:customer_retention/config/constant.dart';
import 'package:customer_retention/helper/rest_exception.dart';
import 'package:customer_retention/model/dao/error_response.dart';
import 'package:customer_retention/model/dao/login_response.dart';
import 'package:customer_retention/model/dao/verify_token_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<LoginResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(Constant.baseUrl + "/api/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw RestException(ErrorResponse.fromJson(jsonDecode(response.body)),
          response.statusCode);
    }
  }

  static Future<VerifyTokenResponse> validate(String token) async {
    final response = await http.get(
      Uri.parse(Constant.baseUrl + "/api/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "TOKEN": token
      },
    );
    if (response.statusCode == 200) {
      return VerifyTokenResponse.fromJson(jsonDecode(response.body));
    } else {
      throw RestException(ErrorResponse.fromJson(jsonDecode(response.body)),
          response.statusCode);
    }
  }
}
