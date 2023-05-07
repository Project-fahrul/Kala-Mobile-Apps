import 'package:customer_retention/api/customer_api.dart';
import 'package:customer_retention/component/customer_modal_layout.dart';
import 'package:customer_retention/component/customer_prospek_comp.dart';
import 'package:customer_retention/component/customer_regular.dart';
import 'package:customer_retention/component/customer_trust_comp.dart';
import 'package:customer_retention/component/list_item_customer.dart';
import 'package:customer_retention/component/loading_wrapper.dart';
import 'package:customer_retention/model/customer_regular_model.dart';
import 'package:customer_retention/model/customer_trust_model.dart';
import 'package:customer_retention/model/dao/customer_prospek_model.dart';
import 'package:customer_retention/model/dao/customer_response.dart';
import 'package:customer_retention/model/dao/kendaraan_model.dart';
import 'package:flutter/material.dart';

class CustomerFragment extends StatefulWidget {
  CustomerFragment(
      {super.key,
      required this.customerResponse,
      required this.customersProspek,
      required this.salesId,
      required this.customerTrust,
      required this.token,
      required this.kendaraan});
  List<CustomerRegularModel>? customerResponse;
  List<CustomerProspekModel>? customersProspek;
  List<CustomerTrustModel>? customerTrust;
  List<KendaraanModel> kendaraan;
  int salesId;
  String token;
  @override
  State<CustomerFragment> createState() => _CustomerFragmentState();
}

class _CustomerFragmentState extends State<CustomerFragment> {
  bool editForm = true;
  int pageCustomer = 0;
  LoadingWrapperController controller = LoadingWrapperController();
  LoadingWrapperController controllerRegular = LoadingWrapperController();

  void createCustomerProspek() async {
    controller.setError = false;
    controllerRegular.setError = false;
    CustomerProspekModel d = CustomerProspekModel(
        id: 0,
        alamat: "",
        name: "",
        noHp: "",
        tipeKendaraan: widget.kendaraan.first.tipeKendaraan,
        ulangTahun: DateTime.now(),
        followUp: DateTime.now(),
        statusProspek: "MEDIUM",
        kendaraanSaatIni: "",
        pengeluaranCustomer: "0",
        isiPembicaraan: "",
        penghasilanCustomer: "",
        jumlahPertemuan: 0);
    bool pop = false;
    controller.setCallback(() async {
      if (d.statusProspek == "SOLD") {
        pop = true;
        CustomerRegularModel regularModel = CustomerRegularModel(
            id: 0,
            address: d.alamat,
            leasing: "",
            name: d.name,
            noHp: d.noHp,
            noRangka: "",
            salesId: widget.salesId,
            tglAngsuran: DateTime.now(),
            tglDec: DateTime.now(),
            tglLahir: d.ulangTahun,
            tglStnk: DateTime.now(),
            totalAngsuran: 0,
            typeAngsuran: "Tunai",
            typeKendaraan: d.kendaraanSaatIni);
        await createCustomerRegular(d: regularModel);
      }
      controller.setLoading(true);
      print("save prospek");
      bool res = await CustomerApi.saveCustomerProspek(widget.token, d);
      controller.setLoading(false);
      List<CustomerProspekModel> list =
          (await CustomerApi.getCustomerProspek(widget.token)).data;
      setState(() {
        widget.customersProspek!.clear();
        widget.customersProspek!.addAll(list);
      });
      if (Navigator.canPop(context)) Navigator.pop(context);
    });
    await showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (cx) => Padding(
              padding: MediaQuery.of(cx).viewInsets,
              child: LoadingWrapper(
                  loadingWrapperController: controller,
                  widget: CustomerProspekComp(false,
                      customerProspekModel: d,
                      kendaraan: widget.kendaraan,
                      controller: controller)),
            ));
    if (pop && Navigator.canPop(context)) Navigator.pop(context);
  }

  void editCustomerProspek(BuildContext ctx, int i) async {
    controller.setError = false;
    controllerRegular.setError = false;
    CustomerProspekModel d = widget.customersProspek!.elementAt(i);
    d.customerId = d.id;
    bool pop = false;
    controller.setDeleteCallback = (int id) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      child: Text("Tidak")),
                  TextButton(
                      onPressed: () async {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                        controller.setLoading(true);
                        await CustomerApi.deleteCustomerProspek(
                            id, widget.token);
                        List<CustomerProspekModel> list =
                            (await CustomerApi.getCustomerProspek(widget.token))
                                .data;
                        setState(() {
                          widget.customersProspek = list;
                        });
                        controller.setLoading(false);
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      child: Text("Ya")),
                ],
                title: Text("Konfirmasi"),
                content: Text("Yakin ingin menghapus?"),
              ));
    };
    controller.setCallback(() async {
      if (d.statusProspek == "SOLD") {
        pop = true;
        CustomerRegularModel regularModel = CustomerRegularModel(
            id: 0,
            address: d.alamat,
            leasing: "",
            name: d.name,
            noHp: d.noHp,
            noRangka: "",
            salesId: widget.salesId,
            tglAngsuran: DateTime.now(),
            tglDec: DateTime.now(),
            tglLahir: d.ulangTahun,
            tglStnk: DateTime.now(),
            totalAngsuran: 0,
            typeAngsuran: "",
            typeKendaraan: d.kendaraanSaatIni);
        await createCustomerRegular(d: regularModel);
      }
      controller.setLoading(true);
      print("edit save prospek");
      bool res = await CustomerApi.editCustomerProspek(widget.token, d);
      controller.setLoading(false);
      List<CustomerProspekModel> list =
          (await CustomerApi.getCustomerProspek(widget.token)).data;
      setState(() {
        widget.customersProspek!.clear();
        widget.customersProspek!.addAll(list);
      });
      if (Navigator.canPop(context)) Navigator.pop(context);
    });
    await showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: ctx,
        builder: (cx) => Padding(
              padding: MediaQuery.of(cx).viewInsets,
              child: LoadingWrapper(
                  loadingWrapperController: controller,
                  widget: CustomerProspekComp(
                    true,
                    customerProspekModel: d,
                    controller: controller,
                    kendaraan: widget.kendaraan,
                  )),
            ));
  }

  void createCustomerTrust() async {
    controller.setError = false;
    controllerRegular.setError = false;
    bool pop = false;
    CustomerTrustModel d = CustomerTrustModel(
        id: 0,
        alamat: "",
        name: "",
        noHp: "",
        jenisKendaraan: widget.kendaraan.first.tipeKendaraan,
        followUp: DateTime.now(),
        statusProspek: "MEDIUM",
        kendaraanSaatIni: "",
        hargaCustomer: "0",
        hargaOlx: "0",
        hargaTrust: "0",
        pembayaran: "Tunai",
        pembicaraan: "",
        tahun: "2000");
    controller.setCallback(() async {
      if (d.statusProspek == "SOLD") {
        pop = true;
        CustomerRegularModel regularModel = CustomerRegularModel(
            id: 0,
            address: d.alamat,
            leasing: "",
            name: d.name,
            noHp: d.noHp,
            noRangka: "",
            salesId: widget.salesId,
            tglAngsuran: DateTime.now(),
            tglDec: DateTime.now(),
            tglLahir: DateTime.now(),
            tglStnk: DateTime.now(),
            totalAngsuran: 0,
            typeAngsuran: d.pembayaran,
            typeKendaraan: d.jenisKendaraan);
        await createCustomerRegular(d: regularModel);
      }
      controller.setLoading(true);
      print("save trust");
      bool res = await CustomerApi.saveCustomerTrust(widget.token, d);
      controller.setLoading(false);
      List<CustomerTrustModel> list =
          (await CustomerApi.getCustomerTrust(widget.token)).data;
      setState(() {
        widget.customerTrust!.clear();
        widget.customerTrust!.addAll(list);
      });
      if (Navigator.canPop(context)) Navigator.pop(context);
    });
    await showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (cx) => Padding(
              padding: MediaQuery.of(cx).viewInsets,
              child: LoadingWrapper(
                  loadingWrapperController: controller,
                  widget: CustomerTrust(false,
                      customerTrust: d,
                      kendaraan: widget.kendaraan,
                      controller: controller)),
            ));
    if (pop && Navigator.canPop(context)) Navigator.pop(context);
  }

  void editCustomerTrust(BuildContext ctx, int i) async {
    controller.setError = false;
    controllerRegular.setError = false;
    CustomerTrustModel d = widget.customerTrust!.elementAt(i);
    d.customerId = d.id;
    bool pop = false;
    controller.setDeleteCallback = (int id) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      child: Text("Tidak")),
                  TextButton(
                      onPressed: () async {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                        controller.setLoading(true);
                        await CustomerApi.deleteCustomerTrust(id, widget.token);
                        List<CustomerTrustModel> list =
                            (await CustomerApi.getCustomerTrust(widget.token))
                                .data;
                        setState(() {
                          widget.customerTrust = list;
                        });
                        controller.setLoading(false);
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      child: Text("Ya")),
                ],
                title: Text("Konfirmasi"),
                content: Text("Yakin ingin menghapus?"),
              ));
    };
    controller.setCallback(() async {
      if (d.statusProspek == "SOLD") {
        pop = true;
        CustomerRegularModel regularModel = CustomerRegularModel(
            id: 0,
            address: d.alamat,
            leasing: "",
            name: d.name,
            noHp: d.noHp,
            noRangka: "",
            salesId: widget.salesId,
            tglAngsuran: DateTime.now(),
            tglDec: DateTime.now(),
            tglLahir: DateTime.now(),
            tglStnk: DateTime.now(),
            totalAngsuran: 0,
            typeAngsuran: d.pembayaran,
            typeKendaraan: d.jenisKendaraan);
        await createCustomerRegular(d: regularModel);
      }
      controller.setLoading(true);
      print("edit save trust");
      bool res = await CustomerApi.editCustomerTrust(widget.token, d);
      controller.setLoading(false);
      List<CustomerTrustModel> list =
          (await CustomerApi.getCustomerTrust(widget.token)).data;
      setState(() {
        widget.customerTrust!.clear();
        widget.customerTrust!.addAll(list);
      });
      if (Navigator.canPop(context)) Navigator.pop(context);
    });
    await showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: ctx,
        builder: (cx) => Padding(
              padding: MediaQuery.of(cx).viewInsets,
              child: LoadingWrapper(
                  loadingWrapperController: controller,
                  widget: CustomerTrust(
                    true,
                    customerTrust: d,
                    controller: controller,
                    kendaraan: widget.kendaraan,
                  )),
            ));
    if (pop && Navigator.canPop(context)) Navigator.pop(context);
  }

  Future<bool> createCustomerRegular({CustomerRegularModel? d}) async {
    controller.setError = false;
    controllerRegular.setError = false;
    bool pop = d != null;
    late BuildContext dContext;
    d ??= CustomerRegularModel(
        id: 0,
        address: "",
        leasing: "",
        name: "",
        noHp: "",
        noRangka: "",
        salesId: widget.salesId,
        tglAngsuran: DateTime.now(),
        tglDec: DateTime.now(),
        tglLahir: DateTime.now(),
        tglStnk: DateTime.now(),
        totalAngsuran: 0,
        typeAngsuran: "",
        typeKendaraan: "");
    controllerRegular.setCallback(() async {
      controllerRegular.setLoading(true);
      print("save regular");
      bool res = await CustomerApi.saveCustomerRegular(widget.token, d!);
      controllerRegular.setLoading(false);
      List<CustomerRegularModel> list =
          (await CustomerApi.getCustomerRegular(widget.token)).data;
      setState(() {
        widget.customerResponse!.clear();
        widget.customerResponse!.addAll(list);
      });
      if (Navigator.canPop(dContext)) Navigator.pop(dContext);
    });
    await showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          dContext = context;
          return Padding(
            padding: MediaQuery.of(ctx).viewInsets,
            child: LoadingWrapper(
                loadingWrapperController: controllerRegular,
                widget: CustomerRegular(
                  false,
                  customerRegularModel: d!,
                  controller: controllerRegular,
                  token: widget.token,
                )),
          );
        });

    return true;
  }

  void editCustomerRegular(BuildContext ctx, int i) async {
    controller.setError = false;
    controllerRegular.setError = false;
    CustomerRegularModel d = widget.customerResponse!.elementAt(i);
    d.customerId = d.id;
    controllerRegular.setDeleteCallback = (int id) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      child: Text("Tidak")),
                  TextButton(
                      onPressed: () async {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                        controllerRegular.setLoading(true);
                        await CustomerApi.deleteCustomerRegular(
                            id, widget.token);
                        List<CustomerRegularModel> list =
                            (await CustomerApi.getCustomerRegular(widget.token))
                                .data;
                        setState(() {
                          widget.customerResponse = list;
                        });
                        controllerRegular.setLoading(false);
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      child: Text("Ya")),
                ],
                title: Text("Konfirmasi"),
                content: Text("Yakin ingin menghapus?"),
              ));
    };
    controllerRegular.setCallback(() async {
      controllerRegular.setLoading(true);
      print("edit save regular");
      bool res = await CustomerApi.editCustomerRegular(widget.token, d);
      controllerRegular.setLoading(false);
      List<CustomerRegularModel> list =
          (await CustomerApi.getCustomerRegular(widget.token)).data;
      setState(() {
        widget.customerResponse!.clear();
        widget.customerResponse!.addAll(list);
      });
      if (Navigator.canPop(context)) Navigator.pop(context);
    });
    await showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: ctx,
        builder: (cx) => Padding(
              padding: MediaQuery.of(cx).viewInsets,
              child: LoadingWrapper(
                  loadingWrapperController: controllerRegular,
                  widget: CustomerRegular(
                    true,
                    customerRegularModel: d,
                    controller: controllerRegular,
                    token: widget.token,
                  )),
            ));
  }

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
                      if (pageCustomer == 0)
                        createCustomerRegular();
                      else if (pageCustomer == 1)
                        createCustomerProspek();
                      else if (pageCustomer == 2) createCustomerTrust();
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
          if (widget.customerResponse == null)
            Text("Data Kosong")
          else
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: ListView.separated(
                  itemBuilder: (ctx, i) {
                    String name = "", tipeKendaraan = "";
                    if (pageCustomer == 0) {
                      CustomerRegularModel d =
                          widget.customerResponse!.elementAt(i);
                      name = d.name;
                      tipeKendaraan = d.typeKendaraan;
                    } else if (pageCustomer == 1) {
                      CustomerProspekModel p =
                          widget.customersProspek!.elementAt(i);
                      name = p.name;
                      tipeKendaraan = p.tipeKendaraan;
                    } else if (pageCustomer == 2) {
                      CustomerTrustModel p = widget.customerTrust!.elementAt(i);
                      name = p.name;
                      tipeKendaraan = p.statusProspek;
                    }
                    return GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        child: ListItemCustomer(
                          name: name,
                          typeKendaraan: tipeKendaraan,
                        ),
                      ),
                      onTap: () {
                        if (pageCustomer == 0)
                          editCustomerRegular(ctx, i);
                        else if (pageCustomer == 1)
                          editCustomerProspek(ctx, i);
                        else if (pageCustomer == 2) editCustomerTrust(ctx, i);
                      },
                    );
                  },
                  separatorBuilder: (_, i) => const Divider(
                        color: Colors.transparent,
                        height: 25,
                      ),
                  itemCount: pageCustomer == 0
                      ? widget.customerResponse!.length
                      : pageCustomer == 1
                          ? widget.customersProspek!.length
                          : pageCustomer == 2
                              ? widget.customerTrust!.length
                              : 0),
            ))
        ],
      ),
    );
  }
}
