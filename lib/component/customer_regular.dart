import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/loading_wrapper.dart';
import 'package:customer_retention/model/customer_regular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomerRegular extends StatefulWidget {
  CustomerRegular(
      {super.key,
      required this.customerRegularModel,
      required this.controller});
  CustomerRegularModel customerRegularModel;
  LoadingWrapperController controller;

  @override
  State<CustomerRegular> createState() => _CustomerRegularState();
}

class _CustomerRegularState extends State<CustomerRegular> {
  TextEditingController controllerDec = TextEditingController();
  TextEditingController controllerLahir = TextEditingController();
  TextEditingController controllerStnk = TextEditingController();
  TextEditingController controllerService = TextEditingController();
  bool angsuranEnable = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerDec.text =
        "${widget.customerRegularModel.tglDec.year}-${widget.customerRegularModel.tglDec.month}-${widget.customerRegularModel.tglDec.day}";
    controllerLahir.text =
        "${widget.customerRegularModel.tglLahir.year}-${widget.customerRegularModel.tglLahir.month}-${widget.customerRegularModel.tglLahir.day}";
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
                IconButton(
                    color: Colors.white,
                    onPressed: () {
                      widget.controller.toggleLoading();
                    },
                    icon: const Icon(Icons.save)),
              ],
            )),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  initialValue: widget.customerRegularModel.name,
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
                  initialValue: widget.customerRegularModel.address,
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
                  initialValue: widget.customerRegularModel.noHp,
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
                  onTap: () => {
                    if (angsuranEnable)
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2090))
                          .then((value) {
                        if (value != null) {
                          controllerDec.text =
                              "${value.year}-${value.month}-${value.day}";
                        }
                      })
                  },
                  controller: controllerDec,
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
                  onTap: () => {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2090))
                        .then((value) {
                      if (value != null) {
                        controllerDec.text =
                            "${value.year}-${value.month}-${value.day}";
                      }
                    })
                  },
                  controller: controllerDec,
                  decoration: const InputDecoration(
                      labelText: "Tanggal Dec",
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
                        controllerDec.text =
                            "${value.year}-${value.month}-${value.day}";
                      }
                    })
                  },
                  controller: controllerDec,
                  decoration: const InputDecoration(
                      labelText: "Tanggal Dec",
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
                        controllerDec.text =
                            "${value.year}-${value.month}-${value.day}";
                      }
                    })
                  },
                  controller: controllerDec,
                  decoration: const InputDecoration(
                      labelText: "Tanggal Dec",
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
                            value:
                                widget.customerRegularModel.typeAngsuran == ""
                                    ? "Tunai"
                                    : widget.customerRegularModel.typeAngsuran,
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
                  initialValue: widget.customerRegularModel.noRangka,
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
            ],
          ),
        )
      ]),
    );
  }
}
