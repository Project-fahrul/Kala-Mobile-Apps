import 'package:customer_retention/component/customer_modal_layout.dart';
import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/profile_modal_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key});

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  bool editForm = true;
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
                          builder: (contexx) => const ProfileModalLayout());
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Nama",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text("Fahrul"),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text("fahrulputra40@gmail.com"),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Nomor Hp",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text("08123456789"),
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
                      "Password baru",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const InputField(Icon(Icons.key)),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Password baru",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const InputField(Icon(Icons.key)),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3C8F6C),
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width)),
                        onPressed: () {},
                        child: const Text("Simpan Password"),
                      )),
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
                        onPressed: () {},
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
