import 'package:customer_retention/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileModalLayout extends StatefulWidget {
  ProfileModalLayout({super.key, required this.profileModel});
  ProfileModel profileModel;

  @override
  State<ProfileModalLayout> createState() => _ProfileModalLayoutState();
}

class _ProfileModalLayoutState extends State<ProfileModalLayout> {
  bool formReadOnly = true;
  late ProfileModel profileModelEdit;

  @override
  void initState() {
    // TODO: implement initState
    profileModelEdit = widget.profileModel.copyWith();
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
              margin: EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Form Profile",
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
                            if (formReadOnly) {
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
                                        profileModelEdit =
                                            widget.profileModel.copyWith();
                                      });
                                      Navigator.pop(contexx);
                                    },
                                    child: const Text("Tidak")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(contexx);
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
                    ],
                  )
                ],
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: formReadOnly ? 1 : 2,
                                color: formReadOnly
                                    ? Color.fromARGB(255, 131, 131, 131)
                                    : Color(0xFF0E7F49)))),
                    child: TextFormField(
                      onChanged: (value) => profileModelEdit.name = value,
                      controller:
                          TextEditingController(text: profileModelEdit.name),
                      readOnly: formReadOnly,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero),
                    ),
                  ),
                  const Divider(
                    height: 18,
                    color: Colors.transparent,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: formReadOnly ? 1 : 2,
                                color: formReadOnly
                                    ? Color.fromARGB(255, 131, 131, 131)
                                    : Color(0xFF0E7F49)))),
                    child: TextFormField(
                      onChanged: (value) => profileModelEdit.email = value,
                      readOnly: formReadOnly,
                      controller:
                          TextEditingController(text: profileModelEdit.email),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero),
                    ),
                  ),
                  const Divider(
                    height: 18,
                    color: Colors.transparent,
                  ),
                  const Text(
                    "Nomor Hp",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: formReadOnly ? 1 : 2,
                                color: formReadOnly
                                    ? Color.fromARGB(255, 131, 131, 131)
                                    : Color(0xFF0E7F49)))),
                    child: TextFormField(
                      onChanged: (value) =>
                          profileModelEdit.phoneNumber = value,
                      readOnly: formReadOnly,
                      controller: TextEditingController(
                          text: profileModelEdit.phoneNumber),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero),
                    ),
                  ),
                  const Divider(
                    height: 18,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
