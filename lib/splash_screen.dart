import 'dart:async';

import 'package:customer_retention/api/login_api.dart';
import 'package:customer_retention/model/dao/template_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_app_update/in_app_update.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().catchError((e) => print(e));
      }
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      await checkForUpdate();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString("kallaToken");
      if (token != null) {
        print("validate token");
        LoginApi.validate(token).then((value) {
          TemplateModel model = TemplateModel(
              value.name, token, value.id, value.phoneNumber, value.email);
          print("validate token finish");
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
