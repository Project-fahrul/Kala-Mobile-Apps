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
  CustomerTrust(
      {super.key,
      required this.kendaraan,
      required this.customerTrust,
      required this.controller});
  CustomerTrustModel customerTrust;
  LoadingWrapperController controller;
  List<KendaraanModel> kendaraan;

  @override
  State<CustomerTrust> createState() => _CustomerTrustState();
}

class _CustomerTrustState extends State<CustomerTrust> {
  TextEditingController controllerFollowUp = TextEditingController();
  TextEditingController controllerJumlah = TextEditingController(text: "0");
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                IconButton(
                    color: Colors.white,
                    onPressed: widget.controller.getCallback,
                    icon: const Icon(Icons.save)),
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
                  initialValue: widget.customerTrust.name,
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
                  initialValue: widget.customerTrust.alamat,
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
                  initialValue: widget.customerTrust.noHp,
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
                  onTap: () => {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
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
                            value: widget.customerTrust.jenisKendaraan,
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
                            value: widget.customerTrust.statusProspek,
                            items: ["LOW", "MEDIUM", "HOT", "SOLD"]
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
                            value: widget.customerTrust.pembayaran == ""
                                ? "Tunai"
                                : widget.customerTrust.pembayaran,
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
                  initialValue: widget.customerTrust.hargaCustomer,
                  onChanged: (val) => widget.customerTrust.hargaCustomer = val,
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
                  initialValue: widget.customerTrust.hargaOlx,
                  onChanged: (val) => widget.customerTrust.hargaOlx = val,
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
                  initialValue: widget.customerTrust.hargaTrust,
                  onChanged: (val) => widget.customerTrust.hargaTrust = val,
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
                  initialValue: widget.customerTrust.pembicaraan,
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
