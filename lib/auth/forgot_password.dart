import 'package:customer_retention/component/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 18),
                                    child: InputField(Icon(Icons.email)),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0E7F49),
                                          fixedSize: Size.fromWidth(
                                              MediaQuery.of(context)
                                                  .size
                                                  .width)),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/confirm_token");
                                      },
                                      child: const Text("Konfirmasi Email")),
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