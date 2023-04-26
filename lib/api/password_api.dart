import 'dart:convert';

import 'package:customer_retention/config/constant.dart';
import 'package:customer_retention/model/dao/password_model.dart';
import 'package:http/http.dart' as http;

class PasswordApi {
  static Future<bool> changePassword(
      String oldPwd, String newPwd, String token) async {
    final res = await http.patch(Uri.parse(Constant.baseUrl + "/api/password"),
        headers: <String, String>{
          Constant.Media_Content_Type: Constant.Media_Type_JSON,
          Constant.AUTHENTICATION: token
        },
        body: jsonEncode(<String, String>{"old": oldPwd, "new": newPwd}));
    print(res.body);
    if (res.statusCode == 200) {
      PasswordModel model = PasswordModel.fromJson(jsonDecode(res.body));
      return model.status == 1;
    }
    return false;
  }
}
