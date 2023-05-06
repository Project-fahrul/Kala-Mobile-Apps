import 'package:customer_retention/api/customer_api.dart';
import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/loading_wrapper.dart';
import 'package:customer_retention/component/modal.dart';
import 'package:customer_retention/model/customer_regular_model.dart';
import 'package:customer_retention/model/customer_trust_model.dart';
import 'package:customer_retention/model/dao/customer_prospek_model.dart';
import 'package:customer_retention/model/dao/kendaraan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomerTrust extends StatefulWidget {
  CustomerTrust(this.isEdit,
      {super.key,
      required this.kendaraan,
      required this.customerTrust,
      required this.controller});
  CustomerTrustModel customerTrust;
  LoadingWrapperController controller;
  List<KendaraanModel> kendaraan;
  final bool isEdit;

  @override
  State<CustomerTrust> createState() => _CustomerTrustState();
}

class _CustomerTrustState extends State<CustomerTrust> {
  TextEditingController controllerFollowUp = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController kendaraanSaatIniController = TextEditingController();
  TextEditingController tahunController = TextEditingController();
  TextEditingController pembicaraanController = TextEditingController();

  TextEditingController hargaCustomerController = TextEditingController();
  TextEditingController hargaTrustController = TextEditingController();
  TextEditingController hargaOlxController = TextEditingController();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  final List<String> status = ["MEDIUM", "HOT", "SOLD"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.text = widget.customerTrust.name;
    alamatController.text = widget.customerTrust.alamat;
    noHpController.text = widget.customerTrust.noHp;
    kendaraanSaatIniController.text = widget.customerTrust.kendaraanSaatIni;
    tahunController.text = widget.customerTrust.tahun;
    pembicaraanController.text = widget.customerTrust.pembicaraan;

    hargaCustomerController.text = widget.customerTrust.hargaCustomer;
    hargaOlxController.text = widget.customerTrust.hargaOlx;
    hargaTrustController.text = widget.customerTrust.hargaTrust;

    controllerFollowUp.text =
        "${widget.customerTrust.followUp.year}-${widget.customerTrust.followUp.month}-${widget.customerTrust.followUp.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Container(
            color: Color(0xFFF5C056),
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Form Customer Trust",
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
                          setState(() {
                            widget.controller.setError = false;
                          });
                          if (widget.customerTrust.name.isEmpty ||
                              widget.customerTrust.alamat.isEmpty ||
                              widget.customerTrust.noHp.isEmpty ||
                              widget.customerTrust.hargaCustomer.isEmpty ||
                              widget.customerTrust.hargaOlx.isEmpty ||
                              widget.customerTrust.hargaTrust.isEmpty ||
                              widget.customerTrust.jenisKendaraan.isEmpty ||
                              widget.customerTrust.kendaraanSaatIni.isEmpty) {
                            setState(() {
                              widget.controller.setError = true;
                            });
                            return;
                          }
                          widget.controller.getCallback();
                        },
                        icon: const Icon(Icons.save)),
                    if (widget.isEdit)
                      IconButton(
                          color: Colors.white,
                          onPressed: widget.controller.getCallback,
                          icon: const Icon(Icons.delete)),
                  ],
                )
              ],
            )),
        Expanded(
          child: ListView(
            children: [
              if (widget.controller.error)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Modal("Kolom harus diisi"),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: nameController,
                  onChanged: (val) => widget.customerTrust.name = val,
                  decoration: const InputDecoration(
                      labelText: "Nama Customer",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 133, 132)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: TextFormField(
                  controller: alamatController,
                  onChanged: (val) => widget.customerTrust.alamat = val,
                  decoration: const InputDecoration(
                      labelText: "Alamat Customer",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 133, 132)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: TextFormField(
                  controller: noHpController,
                  onChanged: (val) => widget.customerTrust.noHp = val,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numb
                  decoration: const InputDecoration(
                      labelText: "No Hp Customer",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 133, 132)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: TextFormField(
                  keyboardType: TextInputType.none,
                  onTap: () => {
                    showDatePicker(
                            context: context,
                            initialDate: widget.customerTrust.followUp,
                            firstDate: DateTime(1945),
                            lastDate: DateTime(2090))
                        .then((value) {
                      if (value != null) {
                        controllerFollowUp.text =
                            "${value.year}-${value.month}-${value.day}";
                        widget.customerTrust.followUp =
                            dateFormat.parse(controllerFollowUp.text);
                      }
                    })
                  },
                  controller: controllerFollowUp,
                  decoration: const InputDecoration(
                      labelText: "Rencana follow up",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 133, 132)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132)))),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black38))),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tipe kendaraan",
                          style: TextStyle(color: Colors.black38, fontSize: 12),
                        ),
                        Divider(
                          height: 3,
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                            isDense: true,
                            value: widget.kendaraan
                                    .where((element) =>
                                        element.tipeKendaraan ==
                                        widget.customerTrust.jenisKendaraan)
                                    .isEmpty
                                ? widget.kendaraan.first.tipeKendaraan
                                : widget.customerTrust.jenisKendaraan,
                            items: widget.kendaraan
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.tipeKendaraan),
                                      value: e.tipeKendaraan,
                                    ))
                                .toList(),
                            onChanged: (d) {
                              setState(() {
                                widget.customerTrust.jenisKendaraan =
                                    d.toString();
                              });
                            },
                          )),
                        ),
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black38))),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Status prospek",
                          style: TextStyle(color: Colors.black38, fontSize: 12),
                        ),
                        Divider(
                          height: 3,
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                            isDense: true,
                            value: status.contains(
                                    widget.customerTrust.statusProspek)
                                ? widget.customerTrust.statusProspek
                                : status.first,
                            items: status
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (d) {
                              setState(() {
                                widget.customerTrust.statusProspek =
                                    d.toString();
                              });
                            },
                          )),
                        ),
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black38))),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pembayaran",
                          style: TextStyle(color: Colors.black38, fontSize: 12),
                        ),
                        Divider(
                          height: 3,
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                            isDense: true,
                            value: ["Tunai", "Kredit"].contains(
                                    widget.customerTrust.pembayaran == ""
                                        ? "Tunai"
                                        : widget.customerTrust.pembayaran)
                                ? widget.customerTrust.pembayaran
                                : "Tunai",
                            items: const [
                              DropdownMenuItem(
                                child: Text("Tunai"),
                                value: "Tunai",
                              ),
                              DropdownMenuItem(
                                child: Text("Kredit"),
                                value: "Kredit",
                              )
                            ],
                            onChanged: (d) {
                              setState(() {
                                widget.customerTrust.pembayaran = d ?? "Tunai";
                              });
                            },
                          )),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  initialValue: widget.customerTrust.kendaraanSaatIni,
                  onChanged: (val) =>
                      widget.customerTrust.kendaraanSaatIni = val,
                  decoration: const InputDecoration(
                      labelText: "Kendaraan saat ini",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 133, 132)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: hargaCustomerController,
                  onChanged: (val) => widget.customerTrust.hargaCustomer = val,
                  inputFormatters: [_rupiah()],
                  decoration: const InputDecoration(
                      labelText: "Harga customer",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 133, 132)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: hargaOlxController,
                  onChanged: (val) => widget.customerTrust.hargaOlx = val,
                  inputFormatters: [_rupiah()],
                  decoration: const InputDecoration(
                      labelText: "Harga OLX",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 133, 132)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: hargaTrustController,
                  onChanged: (val) => widget.customerTrust.hargaTrust = val,
                  inputFormatters: [_rupiah()],
                  decoration: const InputDecoration(
                      labelText: "Harga trust",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 133, 132)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: pembicaraanController,
                  onChanged: (val) => widget.customerTrust.pembicaraan = val,
                  decoration: const InputDecoration(
                      labelText: "Pembicaraan",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 133, 132)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132)))),
                ),
              ),
              const Divider(
                height: 30,
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _rupiah extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    print("${oldValue.text} ${newValue.text}");
    String n = newValue.text;
    String number_string = n.replaceAll(RegExp(r'([^,\d])'), "");
    number_string = number_string.replaceAll(RegExp(r'^0+'), "");
    List<String> split = number_string.split(",");
    int sisa = split[0].length % 3;
    String rupiah = split[0].substring(0, sisa);
    String ribuan = split[0].substring(sisa);

    if (ribuan.length > 0) {
      String sep = sisa > 0 ? "." : "";
      rupiah = rupiah + sep;
      for (int i = 0; i < ribuan.length; i++) {
        if (i % 3 == 0 && i > 0) rupiah = rupiah + ".";
        rupiah = rupiah + ribuan.characters.elementAt(i);
      }
    }
    final String fn = "Rp. " + rupiah;

    return rupiah.length > 0
        ? TextEditingValue(
            text: fn,
            selection:
                TextSelection(baseOffset: fn.length, extentOffset: fn.length))
        : newValue;
  }
}
