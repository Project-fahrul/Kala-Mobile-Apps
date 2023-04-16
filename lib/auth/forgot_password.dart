import 'package:customer_retention/api/forgot_password_api.dart';
import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _controller = TextEditingController(text: "");
  bool _loading = false;
  String? message;
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
                          "Lupa Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0E7F49),
                              fontSize: 40),
                        ),
                        const Text(
                          "Masukkan email anda",
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
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text("Email"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 18),
                                    child: InputField(Icon(Icons.email),
                                        controller: _controller),
                                  ),
                                  ElevatedButton.icon(
                                      icon: _loading
                                          ? const SizedBox(
                                              width: 18,
                                              height: 18,
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : const SizedBox(),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0E7F49),
                                          fixedSize: Size.fromWidth(
                                              MediaQuery.of(context)
                                                  .size
                                                  .width)),
                                      onPressed: () async {
                                        if (!_loading &&
                                            _controller.text.isNotEmpty) {
                                          String messageTemp = "";
                                          setState(() {
                                            _loading = true;
                                          });
                                          if (await ForgotpasswordApi
                                              .verifyEmail(_controller.text)) {
                                            messageTemp =
                                                "Password sementara telah dikirim ke email Anda";
                                          } else {
                                            messageTemp = "Email tidak dikenal";
                                          }
                                          setState(() {
                                            _loading = false;
                                            message = messageTemp;
                                          });
                                        }
                                      },
                                      label: const Text("Konfirmasi Email")),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        const Text("Ingat akun?"),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: GestureDetector(
                                            child: const Text(
                                              "Login",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onTap: () => Navigator.pop(context),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  if (message != null)
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Modal(message!),
                                    )
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
