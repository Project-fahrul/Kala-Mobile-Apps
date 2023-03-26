import 'package:customer_retention/component/customer_fragment.dart';
import 'package:customer_retention/component/evidance_container.dart';
import 'package:customer_retention/component/evidance_date.dart';
import 'package:customer_retention/component/profile_fragment.dart';
import 'package:customer_retention/model/dao/customer_response.dart';
import 'package:customer_retention/model/dao/evidance_response.dart';
import 'package:customer_retention/model/evidance_model.dart';
import 'package:customer_retention/util_test.dart';
import 'package:flutter/material.dart';

class TemplateApp extends StatefulWidget {
  const TemplateApp({super.key});

  @override
  State<TemplateApp> createState() => _TemplateAppState();
}

class _TemplateAppState extends State<TemplateApp> {
  bool search = false, memberPage = false, firstLoad = true;
  int index = 0;
  String textSearch = "";
  TextEditingController textEditingController = TextEditingController();
  EvidanceResponse? evidanceResponse;
  List<CustomerResponse>? customerResponse;

  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      firstLoad = false;
      evidanceResponse = UtilTest.getEvidanceResponse();
      customerResponse = UtilTest().getCustomerResponse();
    }
    return Scaffold(
      appBar: AppBar(
        title: !search
            ? const Text("Customer Retention")
            : Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            textEditingController.clear();
                            setState(() {
                              search = !search;
                              textSearch = "";
                            });
                          },
                        ),
                        hintText: 'Cari Customer...',
                        border: InputBorder.none),
                    onSubmitted: (d) {
                      setState(() {
                        textSearch = d;
                      });
                    },
                    controller: textEditingController,
                  ),
                ),
              ),
        actions: [
          if (!search && index < 2)
            IconButton(
                onPressed: () {
                  setState(() {
                    search = !search;
                  });
                },
                icon: const Icon(Icons.search))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Customer"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: index,
        onTap: (v) => setState(() {
          index = v;
        }),
      ),
      body: Container(
        color: Color(0xFFF2F2F2),
        alignment: search ? Alignment.center : Alignment.topLeft,
        // child: Image.asset("assets/image/search_empty.png"), search empty
        child: Column(
          children: [
            if (index == 0)
              const Padding(
                  padding: EdgeInsets.only(bottom: 5), child: EvidanceDate()),
            if (index == 0)
              Expanded(child: EvidanceContainer(evidanceResponse!, textSearch)),
            if (index == 1)
              Expanded(
                  child: CustomerFragment(
                customerResponse: customerResponse!,
              )),
            if (index == 2) Expanded(child: ProfileFragment())
          ],
        ),
      ),
    );
  }
}
