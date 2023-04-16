import 'dart:async';

import 'package:customer_retention/api/login_api.dart';
import 'package:customer_retention/model/dao/template_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString("kallaToken");
      if (token != null) {
        LoginApi.validate(token).then((value) {
          TemplateModel model = TemplateModel(value.name, token);
          Navigator.pushReplacementNamed(context, "/main", arguments: model);
        }).onError((error, stackTrace) {
          Navigator.pushReplacementNamed(context, "/login");
        });
      } else
        Navigator.pushReplacementNamed(context, "/login");
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/image/icon.png",
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }
}
