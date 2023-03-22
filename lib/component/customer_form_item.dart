import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomerFormItem extends StatelessWidget {
  const CustomerFormItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
