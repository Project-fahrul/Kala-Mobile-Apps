import 'package:customer_retention/model/dao/customer_response.dart';
import 'package:flutter/material.dart';

class CustomerModalLayout extends StatefulWidget {
  CustomerModalLayout(
      {super.key,
      this.createForm: false,
      this.customerResponse,
      this.save,
      this.delete});
  bool createForm;
  CustomerResponse? customerResponse;
  ValueSetter<CustomerResponse>? save, delete;
  @override
  State<CustomerModalLayout> createState() => _CustomerModalLayoutState();
}

class _CustomerModalLayoutState extends State<CustomerModalLayout> {
  bool formReadOnly = true;
  CustomerResponse? customerResponseEdit;

  CustomerResponse composeEmpty() {
    return CustomerResponse(
        id: 0,
        customerName: "",
        address: "",
        phoneNumber: "",
        noRangka: "",
        tipeKendaraan: "",
        leasing: "",
        totalAngsuran: 0,
        tipeAngsuran: "Tunai",
        tglLahir: DateTime.now(),
        tglService: DateTime.now(),
        tglStnk: DateTime.now(),
        tglAngsuran: DateTime.now());
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.createForm) formReadOnly = false;
    customerResponseEdit = widget.customerResponse == null
        ? composeEmpty()
        : widget.customerResponse!.copyWith();
    super.initState();
  }

  @override
  Widget build(BuildContext contexx) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: Color(0xFFF5C056),
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Form Customer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  if (!widget.createForm)
                    Row(
                      children: [
                        IconButton(
                            color: Colors.white,
                            onPressed: () {
                              if (!widget.createForm && formReadOnly) {
                                setState(() {
                                  formReadOnly = false;
                                });
                                return;
                              }
                              AlertDialog alertDialog = AlertDialog(
                                title: const Text("Simpan"),
                                content:
                                    const Text("Anda yakin ingin menyimpan?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          formReadOnly = true;
                                          customerResponseEdit = widget
                                              .customerResponse!
                                              .copyWith();
                                        });
                                        Navigator.pop(contexx);
                                      },
                                      child: const Text("Tidak")),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          formReadOnly = true;
                                        });
                                        Navigator.pop(contexx);
                                        if (widget.save != null) {
                                          widget.save!(customerResponseEdit!);
                                        }
                                      },
                                      child: const Text("Ya")),
                                ],
                              );
                              showDialog(
                                  context: contexx,
                                  useSafeArea: true,
                                  builder: (b) => alertDialog);
                            },
                            icon: Icon(formReadOnly ? Icons.edit : Icons.save)),
                        if (formReadOnly)
                          IconButton(
                              color: Colors.white,
                              onPressed: () {
                                AlertDialog alertDialog = AlertDialog(
                                  title: const Text("Konfirmasi"),
                                  content:
                                      const Text("Anda yakin ingin menghapus?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(contexx);
                                        },
                                        child: const Text("Tidak")),
                                    TextButton(
                                        onPressed: () {
                                          if (widget.delete != null) {
                                            widget
                                                .delete!(customerResponseEdit!);
                                          }
                                        },
                                        child: const Text("Ya")),
                                  ],
                                );
                                showDialog(
                                    context: contexx,
                                    useSafeArea: true,
                                    builder: (b) => alertDialog);
                              },
                              icon: const Icon(Icons.delete)),
                      ],
                    )
                  else
                    IconButton(
                      onPressed: () {
                        AlertDialog alertDialog = AlertDialog(
                          title: const Text("Simpan"),
                          content: const Text("Anda yakin ingin menyimpan?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(contexx);
                                },
                                child: const Text("Tidak")),
                            TextButton(
                                onPressed: () {}, child: const Text("Ya")),
                          ],
                        );
                        showDialog(
                            context: contexx,
                            useSafeArea: true,
                            builder: (b) => alertDialog);
                      },
                      icon: const Icon(Icons.save),
                      color: Colors.white,
                    )
                ],
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [
                  ..._createForm(
                      "Nama Customer", customerResponseEdit!.customerName,
                      readOnly: !formReadOnly, setter: (v) {
                    customerResponseEdit!.customerName = v;
                  }),
                  ..._createForm("Alamat", customerResponseEdit!.address,
                      readOnly: !formReadOnly, setter: (v) {
                    customerResponseEdit!.address = v;
                  }),
                  ..._createForm("Nomor Hp", customerResponseEdit!.phoneNumber,
                      readOnly: !formReadOnly, setter: (v) {
                    customerResponseEdit!.phoneNumber = v;
                  }),
                  ..._createForm("Nomor Rangka", customerResponseEdit!.noRangka,
                      readOnly: !formReadOnly, setter: (v) {
                    customerResponseEdit!.noRangka = v;
                  }),
                  ..._createForm(
                      "Tipe Kendaraan", customerResponseEdit!.tipeKendaraan,
                      readOnly: !formReadOnly, setter: (v) {
                    customerResponseEdit!.tipeKendaraan = v;
                  }),
                  ..._createDropdown("Tipe Angsuran", readOnly: !formReadOnly),
                  ..._createForm("Leasing", customerResponseEdit!.leasing,
                      readOnly: !formReadOnly, setter: (v) {
                    customerResponseEdit!.leasing = v;
                  }),
                  ..._createForm(
                      "Total Angsuran",
                      customerResponseEdit!.tipeAngsuran == "Kredit"
                          ? customerResponseEdit!.totalAngsuran.toString()
                          : "0",
                      readOnly: !formReadOnly &&
                          customerResponseEdit!.tipeAngsuran == "Kredit",
                      setter: (v) {
                    customerResponseEdit!.totalAngsuran = int.parse(v);
                  }),
                  ..._createDate(
                      "Tanggal Lahir",
                      "${customerResponseEdit!.tglLahir.year}-${customerResponseEdit!.tglLahir.month}-${customerResponseEdit!.tglLahir.day}",
                      context, (d) {
                    if (d != null) {
                      setState(() {
                        customerResponseEdit!.tglLahir = d;
                      });
                    }
                  }, readOnly: !formReadOnly),
                  ..._createDate(
                      "Tanggal Angsuran",
                      "${customerResponseEdit!.tglAngsuran.year}-${customerResponseEdit!.tglAngsuran.month}-${customerResponseEdit!.tglAngsuran.day}",
                      context, (d) {
                    if (d != null) {
                      setState(() {
                        customerResponseEdit!.tglAngsuran = d;
                      });
                    }
                  },
                      readOnly: !formReadOnly &&
                          customerResponseEdit!.tipeAngsuran == "Kredit"),
                  ..._createDate(
                      "Tanggal Service",
                      "${customerResponseEdit!.tglService.year}-${customerResponseEdit!.tglService.month}-${customerResponseEdit!.tglService.day}",
                      context, (d) {
                    if (d != null) {
                      setState(() {
                        customerResponseEdit!.tglService = d;
                      });
                    }
                  }, readOnly: !formReadOnly),
                  ..._createDate(
                      "Tanggal STNK",
                      "${customerResponseEdit!.tglStnk.year}-${customerResponseEdit!.tglStnk.month}-${customerResponseEdit!.tglStnk.day}",
                      context, (d) {
                    if (d != null) {
                      setState(() {
                        customerResponseEdit!.tglStnk = d;
                      });
                    }
                  }, readOnly: !formReadOnly)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _createForm(String title, String? initialValue,
      {bool readOnly: false,
      TextInputType textInputType = TextInputType.text,
      ValueSetter<String>? setter}) {
    return [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: readOnly ? 2 : 1,
                    color: readOnly
                        ? Color(0xFF0E7F49)
                        : Color.fromARGB(255, 131, 131, 131)))),
        child: TextFormField(
          keyboardType: textInputType,
          readOnly: !readOnly,
          onChanged: (value) {
            setter?.call(value);
          },
          controller: TextEditingController(text: initialValue),
          decoration: const InputDecoration(
              hintText: "Masukkan data",
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero),
        ),
      ),
      const Divider(
        height: 18,
        color: Colors.transparent,
      )
    ];
  }

  List<Widget> _createDropdown(String title, {bool readOnly: false}) {
    return [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: readOnly ? 2 : 1,
                    color: readOnly
                        ? Color(0xFF0E7F49)
                        : Color.fromARGB(255, 131, 131, 131)))),
        child: !readOnly
            ? Text(customerResponseEdit!.tipeAngsuran)
            : DropdownButtonHideUnderline(
                child: DropdownButton(
                  isDense: true,
                  value: customerResponseEdit!.tipeAngsuran,
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
                      customerResponseEdit!.tipeAngsuran = d ?? "Tunai";
                    });
                  },
                ),
              ),
      ),
      const Divider(
        height: 18,
        color: Colors.transparent,
      )
    ];
  }

  List<Widget> _createDate(String title, String initialValue,
      BuildContext context, ValueSetter<DateTime?> callback,
      {bool readOnly: false}) {
    return [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      GestureDetector(
        onTap: () {
          if (!readOnly) return;
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2080))
              .then((d) {
            callback(d);
          });
        },
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: readOnly ? 2 : 1,
                        color: readOnly
                            ? Color(0xFF0E7F49)
                            : Color.fromARGB(255, 131, 131, 131)))),
            child: Text(initialValue)),
      ),
      const Divider(
        height: 18,
        color: Colors.transparent,
      )
    ];
  }
}
