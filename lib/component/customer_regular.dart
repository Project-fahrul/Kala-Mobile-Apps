import 'package:customer_retention/api/customer_api.dart';
import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/loading_wrapper.dart';
import 'package:customer_retention/component/modal.dart';
import 'package:customer_retention/model/customer_regular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomerRegular extends StatefulWidget {
  CustomerRegular(this.isEdit,
      {super.key,
      required this.customerRegularModel,
      required this.controller,
      required this.token});
  final bool isEdit;
  CustomerRegularModel customerRegularModel;
  LoadingWrapperController controller;
  String token;

  @override
  State<CustomerRegular> createState() => _CustomerRegularState();
}

class _CustomerRegularState extends State<CustomerRegular> {
  TextEditingController controllerAngsuran = TextEditingController();
  TextEditingController controllerLahir = TextEditingController();
  TextEditingController controllerStnk = TextEditingController();
  TextEditingController controllerService = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noRangkaController = TextEditingController();
  TextEditingController typeKendaraanController = TextEditingController();
  TextEditingController totalAngsuranController = TextEditingController();
  TextEditingController leasingController = TextEditingController();

  bool angsuranEnable = false;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leasingController.text = widget.customerRegularModel.leasing;
    nameController.text = widget.customerRegularModel.name;
    phoneNumberController.text = widget.customerRegularModel.noHp;
    alamatController.text = widget.customerRegularModel.address;
    noRangkaController.text = widget.customerRegularModel.noRangka;
    typeKendaraanController.text = widget.customerRegularModel.typeKendaraan;
    totalAngsuranController.text =
        widget.customerRegularModel.totalAngsuran.toString();

    totalAngsuranController = TextEditingController(
        text: widget.customerRegularModel.totalAngsuran.toString());
    controllerAngsuran.text =
        "${widget.customerRegularModel.tglDec.year}-${widget.customerRegularModel.tglDec.month}-${widget.customerRegularModel.tglDec.day}";
    controllerLahir.text =
        "${widget.customerRegularModel.tglLahir.year}-${widget.customerRegularModel.tglLahir.month}-${widget.customerRegularModel.tglLahir.day}";
    controllerStnk.text =
        "${widget.customerRegularModel.tglStnk.year}-${widget.customerRegularModel.tglStnk.month}-${widget.customerRegularModel.tglStnk.day}";
    controllerService.text =
        "${widget.customerRegularModel.tglAngsuran.year}-${widget.customerRegularModel.tglAngsuran.month}-${widget.customerRegularModel.tglAngsuran.day}";

    angsuranEnable = widget.customerRegularModel.typeAngsuran == "Kredit";
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
                  "Form Customer Regular",
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
                          print(widget.customerRegularModel);
                          setState(() {
                            widget.controller.setError = false;
                          });
                          if (widget.customerRegularModel.address.isEmpty ||
                              widget.customerRegularModel.name.isEmpty ||
                              widget.customerRegularModel.leasing.isEmpty ||
                              widget.customerRegularModel.noRangka.isEmpty ||
                              widget
                                  .customerRegularModel.typeKendaraan.isEmpty ||
                              widget.customerRegularModel.noHp.isEmpty) {
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
                  onChanged: (val) => widget.customerRegularModel.name = val,
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
                  onChanged: (val) => widget.customerRegularModel.address = val,
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
                  controller: phoneNumberController,
                  onChanged: (val) => widget.customerRegularModel.noHp = val,
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
                    if (angsuranEnable)
                      showDatePicker(
                              context: context,
                              initialDate:
                                  widget.customerRegularModel.tglAngsuran,
                              firstDate: DateTime(1945),
                              lastDate: DateTime(2090))
                          .then((value) {
                        if (value != null) {
                          print("parse");
                          controllerAngsuran.text =
                              "${value.year}-${value.month}-${value.day}";
                          widget.customerRegularModel.tglAngsuran =
                              dateFormat.parse(controllerAngsuran.text);
                        }
                      })
                  },
                  controller: controllerAngsuran,
                  readOnly: !angsuranEnable,
                  decoration: InputDecoration(
                      filled: !angsuranEnable,
                      fillColor: Colors.black26,
                      labelText: "Tanggal Angsuran",
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 133, 132))),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 131, 133, 132)),
                      border: const UnderlineInputBorder(
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
                            initialDate: widget.customerRegularModel.tglStnk,
                            firstDate: DateTime(1945),
                            lastDate: DateTime(2090))
                        .then((value) {
                      if (value != null) {
                        controllerStnk.text =
                            "${value.year}-${value.month}-${value.day}";
                        widget.customerRegularModel.tglStnk =
                            dateFormat.parse(controllerStnk.text);
                      }
                    })
                  },
                  controller: controllerStnk,
                  decoration: const InputDecoration(
                      labelText: "Tanggal STNK",
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
                            initialDate: widget.customerRegularModel.tglLahir,
                            firstDate: DateTime(1945),
                            lastDate: DateTime(2090))
                        .then((value) {
                      if (value != null) {
                        controllerLahir.text =
                            "${value.year}-${value.month}-${value.day}";
                        widget.customerRegularModel.tglLahir =
                            dateFormat.parse(controllerLahir.text);
                      }
                    })
                  },
                  controller: controllerLahir,
                  decoration: const InputDecoration(
                      labelText: "Tanggal Lahir",
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
                            initialDate: widget.customerRegularModel.tglDec,
                            firstDate: DateTime(1945),
                            lastDate: DateTime(2090))
                        .then((value) {
                      if (value != null) {
                        controllerService.text =
                            "${value.year}-${value.month}-${value.day}";
                        widget.customerRegularModel.tglDec =
                            dateFormat.parse(controllerService.text);
                      }
                    })
                  },
                  controller: controllerService,
                  decoration: const InputDecoration(
                      labelText: "Tanggal Service",
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
                          "Tipe angsuran",
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
                            value: [
                              "Tunai",
                              "Kredit"
                            ].contains(widget.customerRegularModel.typeAngsuran)
                                ? widget.customerRegularModel.typeAngsuran
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
                                widget.customerRegularModel.typeAngsuran =
                                    d ?? "Tunai";
                                angsuranEnable =
                                    widget.customerRegularModel.typeAngsuran ==
                                        "Kredit";
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
                  controller: noRangkaController,
                  onChanged: (val) =>
                      widget.customerRegularModel.noRangka = val,
                  decoration: const InputDecoration(
                      labelText: "No Rangka",
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
                  readOnly: !angsuranEnable,
                  controller: totalAngsuranController,
                  onChanged: (val) {
                    if (val.length > 0) {
                      if (val.characters.characterAt(0) == Characters("0") &&
                          val.length > 1) {
                        // we need to remove the first char
                        totalAngsuranController.text = val.substring(1);
                        // we need to move the cursor
                        totalAngsuranController.selection =
                            TextSelection.collapsed(
                                offset: totalAngsuranController.text.length);
                      }
                      widget.customerRegularModel.totalAngsuran =
                          int.parse(val);
                    } else {
                      totalAngsuranController.text = "0";
                      widget.customerRegularModel.totalAngsuran = 0;
                    }
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numb
                  decoration: InputDecoration(
                      filled: !angsuranEnable,
                      fillColor: Colors.black26,
                      labelText: "Total Angsuran",
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
                  controller: leasingController,
                  onChanged: (val) {
                    widget.customerRegularModel.leasing = val;
                  },
                  decoration: const InputDecoration(
                      labelText: "Leasing",
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
                  controller: typeKendaraanController,
                  onChanged: (val) =>
                      widget.customerRegularModel.typeKendaraan = val,
                  decoration: const InputDecoration(
                      labelText: "Tipe Kendaraan",
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
              Divider(
                height: 30,
              )
            ],
          ),
        )
      ]),
    );
  }
}
