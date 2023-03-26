import 'package:customer_retention/model/dao/customer_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListItemCustomer extends StatelessWidget {
  ListItemCustomer({super.key, required this.customerResponse});
  CustomerResponse customerResponse;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customerResponse.customerName,
              style: const TextStyle(
                color: Color(0xFF030303),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Row(
                children: [
                  const Icon(
                    Icons.work,
                    size: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      customerResponse.tipeKendaraan,
                      style: const TextStyle(fontSize: 13),
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
