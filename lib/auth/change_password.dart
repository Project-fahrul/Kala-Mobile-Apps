import 'package:customer_retention/component/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                          "Ubah Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0E7F49),
                              fontSize: 40),
                        ),
                        const Text(
                          "Masukkan password baru",
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
                                    child: Text("Password"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 18),
                                    child: InputField(Icon(Icons.email)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text("Konfirmasi Password"),
                                  ),
                                  Padding(
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
                                      onPressed: () {},
                                      child: const Text("Ubah Password")),
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
