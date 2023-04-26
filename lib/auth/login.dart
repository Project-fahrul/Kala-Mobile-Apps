import 'dart:async';

import 'package:customer_retention/api/login_api.dart';
import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/modal.dart';
import 'package:customer_retention/helper/rest_exception.dart';
import 'package:customer_retention/model/dao/error_response.dart';
import 'package:customer_retention/model/dao/template_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  bool _loading = false;
  String? messageError;
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  "assets/image/Vector.png",
                )),
            Positioned.fill(
                child: Container(
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0E7F49),
                              fontSize: 40),
                        ),
                        const Text(
                          "Selamat datang di aplikasi Kalla",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, top: 60, right: 24),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/image/kalla2.png"),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 38),
                                    child:
                                        Image.asset("assets/image/kalla1.png"),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 11, bottom: 18),
                                    child: Text("Masukkan akun untuk masuk"),
                                  ),
                                  InputField(Icon(Icons.email),
                                      controller: emailController),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22),
                                    child: InputField(const Icon(Icons.key),
                                        isPassword: true,
                                        controller: passwordController),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 9, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                                height: 24,
                                                width: 24,
                                                child: Checkbox(
                                                    value: false,
                                                    onChanged: (_) {})),
                                            const Padding(
                                              padding: EdgeInsets.only(left: 8),
                                              child: Text("Ingat saya"),
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          child: Text("Lupa kata sandi"),
                                          onTap: () => Navigator.pushNamed(
                                              context, "/forgot"),
                                        )
                                      ],
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: _loading
                                              ? Colors.white
                                              : Color(0xFF0E7F49),
                                          fixedSize: Size.fromWidth(
                                              MediaQuery.of(context)
                                                  .size
                                                  .width)),
                                      onPressed: () async {
                                        if (emailController.text.isNotEmpty &&
                                            passwordController
                                                .text.isNotEmpty &&
                                            !_loading) {
                                          setState(() {
                                            _loading = true;
                                          });
                                          final SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          LoginApi.login(emailController.text,
                                                  passwordController.text)
                                              .then((value) {
                                            prefs.setString(
                                                "kallaToken", value.token);
                                            TemplateModel templateModel =
                                                TemplateModel(
                                                    value.name,
                                                    value.token,
                                                    value.id,
                                                    value.phoneNumber,
                                                    value.email);
                                            Navigator.pushReplacementNamed(
                                                context, "/main",
                                                arguments: templateModel);
                                          }).catchError((e) {
                                            setState(() {
                                              _loading = false;
                                              messageError = e.toString();
                                            });
                                          });
                                        }
                                      },
                                      icon: _loading
                                          ? const SizedBox(
                                              height: 18,
                                              width: 18,
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : const SizedBox(),
                                      label: !_loading
                                          ? const Text("Sign In")
                                          : const Text("")),
                                  if (messageError != null && !_loading)
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Modal(messageError!))
                                ]),
                          ),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
