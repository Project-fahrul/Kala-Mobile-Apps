import 'package:customer_retention/component/customer_form_detail.dart';
import 'package:customer_retention/component/customer_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileModalLayout extends StatefulWidget {
  const ProfileModalLayout({super.key});

  @override
  State<ProfileModalLayout> createState() => _ProfileModalLayoutState();
}

class _ProfileModalLayoutState extends State<ProfileModalLayout> {
  bool editForm = true;
  @override
  Widget build(BuildContext contexx) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: Color(0xFFF5C056),
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Form Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            if (editForm) {
                              setState(() {
                                editForm = false;
                              });
                              return;
                            }
                            AlertDialog alertDialog = AlertDialog(
                              title: const Text("Simpan"),
                              content:
                                  const Text("Anda yakin ingin menyimpan?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        editForm = true;
                                      });
                                      Navigator.pop(contexx);
                                    },
                                    child: const Text("Tidak")),
                                TextButton(
                                    onPressed: () {}, child: const Text("Ya")),
                              ],
                            );
                            showDialog(
                                context: contexx,
                                useSafeArea: true,
                                builder: (b) => alertDialog);
                          },
                          icon: Icon(editForm ? Icons.edit : Icons.save)),
                    ],
                  )
                ],
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 131, 131, 131)))),
                      child: Text("Fahrul")
                      // TextFormField(
                      //   decoration: const InputDecoration(
                      //       border: InputBorder.none,
                      //       isDense: true,
                      //       contentPadding: EdgeInsets.zero),
                      // ),
                      )
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
