import 'package:customer_retention/api/password_api.dart';
import 'package:customer_retention/component/customer_modal_layout.dart';
import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/modal.dart';
import 'package:customer_retention/component/profile_modal_layout.dart';
import 'package:customer_retention/model/dao/template_model.dart';
import 'package:customer_retention/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileFragment extends StatefulWidget {
  ProfileFragment({super.key, required this.templateModel});
  TemplateModel templateModel;

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  bool editForm = true, loadingPassword = false;

  TextEditingController oldPwd = TextEditingController();
  TextEditingController newPwd = TextEditingController();
  TextEditingController newPwdConfirm = TextEditingController();

  String? changePasswordMsg;
  late ProfileModel data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = ProfileModel(
        name: widget.templateModel.name,
        phoneNumber: widget.templateModel.phoneNumber,
        email: widget.templateModel.email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (contexx) => ProfileModalLayout(
                                () {
                                  setState(() {});
                                },
                                profileModel: data,
                                templateModel: widget.templateModel,
                              ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3D916C)),
                    child: const Text("Edit"))
              ],
            ),
          ),
          const Divider(
            thickness: 10,
            height: 10,
            color: Color(0xFFECECEC),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Nama",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(widget.templateModel.name),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(widget.templateModel.email),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Nomor Hp",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(widget.templateModel.phoneNumber),
                  const Divider(height: 20, thickness: 2),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Ganti Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Password lama",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  InputField(Icon(Icons.key),
                      isPassword: true, controller: oldPwd),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(
                      "Password baru",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  InputField(
                    Icon(Icons.key),
                    isPassword: true,
                    controller: newPwd,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Konfirmasi Password",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  InputField(
                    Icon(Icons.key),
                    isPassword: true,
                    controller: newPwdConfirm,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: ElevatedButton.icon(
                        icon: loadingPassword
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator())
                            : const SizedBox(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3C8F6C),
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width)),
                        onPressed: () async {
                          if (newPwd.text.length > 0 &&
                              newPwdConfirm.text.length > 0 &&
                              newPwd.text == newPwdConfirm.text &&
                              !loadingPassword) {
                            setState(() {
                              loadingPassword = true;
                            });
                            if (await PasswordApi.changePassword(oldPwd.text,
                                newPwd.text, widget.templateModel.token)) {
                              changePasswordMsg = "Berhasil";
                            } else {
                              changePasswordMsg =
                                  "Gagal ubah password, pastikan form diisi dengan benar";
                            }
                          } else {
                            changePasswordMsg =
                                "Password form harus diisi dengan benar";
                          }
                          setState(() {
                            loadingPassword = false;
                          });
                        },
                        label: const Text("Simpan Password"),
                      )),
                  if (!loadingPassword && changePasswordMsg != null)
                    Modal(changePasswordMsg!),
                  const Divider(height: 20, thickness: 2),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Color(0xFF3C8F6C),
                            ),
                            shadowColor: Colors.white,
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width)),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.remove("kallaToken");
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: const Text(
                          "Keluar",
                          style: TextStyle(color: Color(0xFF3C8F6C)),
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
