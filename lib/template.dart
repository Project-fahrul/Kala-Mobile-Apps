import 'dart:async';

import 'package:customer_retention/api/customer_api.dart';
import 'package:customer_retention/api/evidance_api.dart';
import 'package:customer_retention/api/kendaraan_api.dart';
import 'package:customer_retention/component/customer_fragment.dart';
import 'package:customer_retention/component/evidance_container.dart';
import 'package:customer_retention/component/evidance_date.dart';
import 'package:customer_retention/component/profile_fragment.dart';
import 'package:customer_retention/model/customer_regular_model.dart';
import 'package:customer_retention/model/customer_trust_model.dart';
import 'package:customer_retention/model/customer_wrapper.dart';
import 'package:customer_retention/model/dao/customer_prospek_model.dart';
import 'package:customer_retention/model/dao/customer_response.dart';
import 'package:customer_retention/model/dao/evidance_response.dart';
import 'package:customer_retention/model/dao/kendaraan_model.dart';
import 'package:customer_retention/model/dao/template_model.dart';
import 'package:customer_retention/model/evidance_model.dart';
import 'package:customer_retention/util_test.dart';
import 'package:flutter/material.dart';

class TemplateApp extends StatefulWidget {
  TemplateApp(this.templateModel, {super.key});
  TemplateModel templateModel;

  @override
  State<TemplateApp> createState() => _TemplateAppState();
}

class _TemplateAppState extends State<TemplateApp> {
  bool search = false, memberPage = false;
  int index = 0;
  String textSearch = "";
  TextEditingController textEditingController = TextEditingController();
  EvidanceResponse? evidanceResponse;
  List<CustomerRegularModel>? customerResponse;
  List<CustomerProspekModel>? customersProspek;
  late List<KendaraanModel> kendaraanModel;
  late List<CustomerTrustModel> customerTrustModel;
  CustomerWrapper customerWrapper = CustomerWrapper();
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() async {
      try {
        print("template query");
        evidanceResponse =
            await EvidanceApi.getEvidance(widget.templateModel.token);
        customerResponse =
            (await CustomerApi.getCustomerRegular(widget.templateModel.token))
                .data;
        customersProspek =
            (await CustomerApi.getCustomerProspek(widget.templateModel.token))
                .data;
        kendaraanModel =
            (await KendaraanApi.getKendaraan(widget.templateModel.token)).data;
        customerTrustModel =
            (await CustomerApi.getCustomerTrust(widget.templateModel.token))
                .data;
      } catch (e) {
        print(e);
      }
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
          if (!search && index < 2 && false)
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
          search = false;
        }),
      ),
      body: Container(
        color: const Color(0xFFF2F2F2),
        alignment: search ? Alignment.center : Alignment.topLeft,
        // child: Image.asset("assets/image/search_empty.png"), search empty
        child: loading
            ? const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  if (index == 0)
                    Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: EvidanceDate(widget.templateModel)),
                  if (index == 0)
                    Expanded(
                        child: EvidanceContainer(evidanceResponse!, textSearch,
                            widget.templateModel.token, (d) {
                      setState(() {
                        evidanceResponse = d;
                      });
                    })),
                  if (index == 1)
                    Expanded(
                        child: CustomerFragment(
                      kendaraan: kendaraanModel,
                      customerTrust: customerTrustModel,
                      customersProspek: customersProspek,
                      customerResponse: customerResponse,
                      salesId: widget.templateModel.id,
                      token: widget.templateModel.token,
                    )),
                  if (index == 2)
                    Expanded(
                        child: ProfileFragment(
                            templateModel: widget.templateModel))
                ],
              ),
      ),
    );
  }
}
