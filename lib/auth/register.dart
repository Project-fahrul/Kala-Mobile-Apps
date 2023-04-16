import 'package:customer_retention/component/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                          "Registrasi",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0E7F49),
                              fontSize: 40),
                        ),
                        const Text(
                          "Daftarkan akun anda untuk menggunakan aplikasi",
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
                                    child: Text("Nama"),
                                  ),
                                  InputField(Icon(Icons.person)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text("Email"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: InputField(Icon(Icons.email)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text("Password"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: InputField(Icon(Icons.key)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text("Konfirmasi Password"),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 18),
                                    child: InputField(Icon(Icons.key)),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0E7F49),
                                          fixedSize: Size.fromWidth(
                                              MediaQuery.of(context)
                                                  .size
                                                  .width)),
                                      onPressed: () {},
                                      child: const Text("Registrasi")),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        Text("Sudah punya akun?"),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: GestureDetector(
                                            child: Text("Login"),
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
