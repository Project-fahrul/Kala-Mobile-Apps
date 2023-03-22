import 'package:customer_retention/component/customer_form_detail.dart';
import 'package:customer_retention/component/customer_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomerModalLayout extends StatefulWidget {
  const CustomerModalLayout({super.key});

  @override
  State<CustomerModalLayout> createState() => _CustomerModalLayoutState();
}

class _CustomerModalLayoutState extends State<CustomerModalLayout> {
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
                    "Form Customer",
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
                      if (editForm)
                        IconButton(
                            color: Colors.white,
                            onPressed: () {
                              AlertDialog alertDialog = AlertDialog(
                                title: const Text("Konfirmasi"),
                                content:
                                    const Text("Anda yakin ingin menghapus?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(contexx);
                                      },
                                      child: const Text("Tidak")),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text("Ya")),
                                ],
                              );
                              showDialog(
                                  context: contexx,
                                  useSafeArea: true,
                                  builder: (b) => alertDialog);
                            },
                            icon: const Icon(Icons.delete)),
                    ],
                  )
                ],
              )),
          ...CustomerFormDetail.createList()
          // )
        ],
      ),
    );
  }
}
