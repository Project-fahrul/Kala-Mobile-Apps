import 'dart:convert';

import 'package:customer_retention/config/constant.dart';
import 'package:http/http.dart' as http;

class ProfileApi {
  static Future<bool> update(String name, String phone, String token) async {
    final res = await http.patch(Uri.parse(Constant.baseUrl + "/api/profile"),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        },
        body: jsonEncode(<String, String>{"name": name, "phone": phone}));
    print(res.body);
    return res.statusCode == 200;
  }
}
