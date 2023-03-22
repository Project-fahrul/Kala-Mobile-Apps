import 'package:customer_retention/component/input_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                                    padding: const EdgeInsets.only(top: 3),
                                    child:
                                        Image.asset("assets/image/kalla1.png"),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 11, bottom: 18),
                                    child: Text("Masukkan akun untuk masuk"),
                                  ),
                                  const InputField(Icon(Icons.email)),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 22),
                                    child: InputField(Icon(Icons.key)),
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
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0E7F49),
                                          fixedSize: Size.fromWidth(
                                              MediaQuery.of(context)
                                                  .size
                                                  .width)),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, "/main");
                                      },
                                      child: const Text("Sign In")),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        Text("Belum punya akun?"),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: GestureDetector(
                                            child: const Text("Registrasi",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, "/register");
                                            },
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
