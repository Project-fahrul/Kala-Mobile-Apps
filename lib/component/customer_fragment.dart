import 'package:customer_retention/component/customer_modal_layout.dart';
import 'package:customer_retention/component/list_item_customer.dart';
import 'package:flutter/material.dart';

class CustomerFragment extends StatefulWidget {
  const CustomerFragment({super.key});

  @override
  State<CustomerFragment> createState() => _CustomerFragmentState();
}

class _CustomerFragmentState extends State<CustomerFragment> {
  bool editForm = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Customer",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (contexx) => const CustomerModalLayout());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3D916C)),
                    child: const Text("Tambah"))
              ],
            ),
          ),
          const Divider(
            thickness: 10,
            height: 10,
            color: Color(0xFFECECEC),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: ListView.separated(
                itemBuilder: (ctx, i) => GestureDetector(
                      child: const ListItemCustomer(),
                      onTap: () {
                        showModalBottomSheet(
                            useSafeArea: true,
                            isScrollControlled: true,
                            context: ctx,
                            builder: (contexx) => const CustomerModalLayout());
                      },
                    ),
                separatorBuilder: (_, i) => const Divider(
                      color: Colors.transparent,
                      height: 25,
                    ),
                itemCount: 5),
          ))
        ],
      ),
    );
  }
}
