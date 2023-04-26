import 'dart:math';

import 'package:customer_retention/api/customer_api.dart';
import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/loading_wrapper.dart';
import 'package:customer_retention/component/modal.dart';
import 'package:customer_retention/model/customer_regular_model.dart';
import 'package:customer_retention/model/dao/customer_prospek_model.dart';
import 'package:customer_retention/model/dao/kendaraan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomerProspekComp extends StatefulWidget {
  CustomerProspekComp(
      {super.key,
      required this.kendaraan,
      required this.customerProspekModel,
      required this.controller});
  CustomerProspekModel customerProspekModel;
  LoadingWrapperController controller;
  List<KendaraanModel> kendaraan;

  @override
  State<CustomerProspekComp> createState() => _CustomerProspekCompState();
}

class _CustomerProspekCompState extends State<CustomerProspekComp> {
  TextEditingController controllerUlangTahun = TextEditingController();
  TextEditingController controllerFollowUp = TextEditingController();
  TextEditingController controllerJumlah = TextEditingController(text: "0");
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerUlangTahun.text =
        "${widget.customerProspekModel.ulangTahun.year}-${widget.customerProspekModel.ulangTahun.month}-${widget.customerProspekModel.ulangTahun.day}";
    controllerFollowUp.text =
        "${widget.customerProspekModel.followUp.year}-${widget.customerProspekModel.followUp.month}-${widget.customerProspekModel.followUp.day}";
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
                  "Form Customer Prospek",
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
                  initialValue: widget.customerProspekModel.name,
                  onChanged: (val) => widget.customerProspekModel.name = val,
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
                  initialValue: widget.customerProspekModel.alamat,
                  onChanged: (val) => widget.customerProspekModel.alamat = val,
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
                  initialValue: widget.customerProspekModel.noHp,
                  onChanged: (val) => widget.customerProspekModel.noHp = val,
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
                        controllerUlangTahun.text =
                            "${value.year}-${value.month}-${value.day}";
                        widget.customerProspekModel.ulangTahun =
                            dateFormat.parse(controllerUlangTahun.text);
                      }
                    })
                  },
                  controller: controllerUlangTahun,
                  decoration: const InputDecoration(
                      labelText: "Ulang tahun",
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
                        widget.customerProspekModel.followUp =
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
                                        widget
                                            .customerProspekModel.tipeKendaraan)
                                    .isEmpty
                                ? widget.kendaraan.first.tipeKendaraan
                                : widget.customerProspekModel.tipeKendaraan,
                            items: widget.kendaraan
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.tipeKendaraan),
                                      value: e.tipeKendaraan,
                                    ))
                                .toList(),
                            onChanged: (d) {
                              setState(() {
                                widget.customerProspekModel.tipeKendaraan =
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
                            value: widget.customerProspekModel.statusProspek,
                            items: ["LOW", "MEDIUM", "HOT", "SOLD"]
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (d) {
                              setState(() {
                                widget.customerProspekModel.statusProspek =
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
                child: TextFormField(
                  controller: controllerJumlah,
                  onChanged: (val) {
                    if (val.length > 0) {
                      if (val.characters.characterAt(0) == Characters("0") &&
                          val.length > 1) {
                        // we need to remove the first char
                        controllerJumlah.text = val.substring(1);
                        // we need to move the cursor
                        controllerJumlah.selection = TextSelection.collapsed(
                            offset: controllerJumlah.text.length);
                      }
                      widget.customerProspekModel.jumlahPertemuan =
                          int.parse(val);
                    } else {
                      controllerJumlah.text = "0";
                      widget.customerProspekModel.jumlahPertemuan = 0;
                    }
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numb
                  decoration: const InputDecoration(
                      fillColor: Colors.black26,
                      labelText: "Jumlah pertemuan",
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
                  initialValue: widget.customerProspekModel.kendaraanSaatIni,
                  onChanged: (val) =>
                      widget.customerProspekModel.kendaraanSaatIni = val,
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
                  initialValue: widget.customerProspekModel.pengeluaranCustomer,
                  onChanged: (val) =>
                      widget.customerProspekModel.pengeluaranCustomer = val,
                  decoration: const InputDecoration(
                      labelText: "Pengeluaran customer",
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
                  initialValue: widget.customerProspekModel.penghasilanCustomer,
                  onChanged: (val) =>
                      widget.customerProspekModel.penghasilanCustomer = val,
                  decoration: const InputDecoration(
                      labelText: "Penghasilan customer",
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
                  initialValue: widget.customerProspekModel.isiPembicaraan,
                  onChanged: (val) =>
                      widget.customerProspekModel.isiPembicaraan = val,
                  decoration: const InputDecoration(
                      labelText: "Isi pembicaraan",
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
