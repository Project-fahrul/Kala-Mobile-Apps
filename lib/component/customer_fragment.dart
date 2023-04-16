import 'package:customer_retention/component/customer_modal_layout.dart';
import 'package:customer_retention/component/customer_regular.dart';
import 'package:customer_retention/component/list_item_customer.dart';
import 'package:customer_retention/component/loading_wrapper.dart';
import 'package:customer_retention/model/customer_regular_model.dart';
import 'package:customer_retention/model/dao/customer_response.dart';
import 'package:flutter/material.dart';

class CustomerFragment extends StatefulWidget {
  CustomerFragment({super.key, required this.customerResponse});
  List<CustomerResponse> customerResponse;
  @override
  State<CustomerFragment> createState() => _CustomerFragmentState();
}

class _CustomerFragmentState extends State<CustomerFragment> {
  bool editForm = true;
  int pageCustomer = 0;
  LoadingWrapperController controller = LoadingWrapperController();
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
                          builder: (contexx) => CustomerModalLayout(
                                createForm: true,
                              ));
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
          // Text("data")
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            width: double.infinity,
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => GestureDetector(
                onTap: () {
                  setState(() {
                    pageCustomer = i;
                  });
                },
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: i == pageCustomer
                          ? const Color(0xFF3D916C)
                          : const Color(0xFFD5D5D5)),
                  child: Text(
                    [
                      "Customer Regular",
                      "Customer Prospek",
                      "Customer Trust"
                    ][i],
                    style: TextStyle(
                        color: i == pageCustomer ? Colors.white : Colors.black,
                        fontSize: 14),
                  ),
                ),
              ),
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: ListView.separated(
                itemBuilder: (ctx, i) => GestureDetector(
                      child: ListItemCustomer(
                          customerResponse:
                              widget.customerResponse.elementAt(i)),
                      onTap: () {
                        CustomerRegularModel d = CustomerRegularModel(
                            address: "",
                            leasing: "",
                            name: "",
                            noHp: "",
                            noRangka: "",
                            salesId: 1,
                            tglAngsuran: DateTime.now(),
                            tglDec: DateTime.now(),
                            tglLahir: DateTime.now(),
                            tglStnk: DateTime.now(),
                            totalAngsuran: 1,
                            typeAngsuran: "",
                            typeKendaraan: "");
                        showModalBottomSheet(
                            useSafeArea: true,
                            isScrollControlled: true,
                            context: ctx,
                            builder: (_) => LoadingWrapper(
                                loadingWrapperController: controller,
                                widget: CustomerRegular(
                                  customerRegularModel: d,
                                  controller: controller,
                                )));
                      },
                    ),
                separatorBuilder: (_, i) => const Divider(
                      color: Colors.transparent,
                      height: 25,
                    ),
                itemCount: widget.customerResponse.length),
          ))
        ],
      ),
    );
  }
}
