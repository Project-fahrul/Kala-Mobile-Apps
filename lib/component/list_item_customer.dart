import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListItemCustomer extends StatelessWidget {
  const ListItemCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Fahrul",
              style: TextStyle(
                color: Color(0xFF030303),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Row(
                children: const [
                  Icon(
                    Icons.work,
                    size: 13,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      "Mobil Toyota",
                      style: TextStyle(fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const Icon(
          Icons.info,
          color: Color(0xFFFEC144),
          // color: Color(0xFF3C8F6C)
        )
      ],
    );
  }
}
