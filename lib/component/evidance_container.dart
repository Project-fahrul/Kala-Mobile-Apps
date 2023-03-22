import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/list_item_evidance.dart';
import 'package:customer_retention/component/my_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EvidanceContainer extends StatefulWidget {
  const EvidanceContainer({super.key});

  @override
  State<EvidanceContainer> createState() => _EvidanceContainerState();
}

class _EvidanceContainerState extends State<EvidanceContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Color(0xFF000000))]),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text("Progres anda"),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "40%",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              PopupMenuButton(
                itemBuilder: (_) => ["Semua", "Belum Terkirim", "Terkirim"]
                    .map((e) => PopupMenuItem(child: Text(e)))
                    .toList(),
                child: Row(
                  children: const [
                    Text("Semua"),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 18),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: LinearProgressIndicator(
                backgroundColor: Color(0xFFE0E0E0),
                color: Color(0xFFF5C056),
                minHeight: 8,
                value: 0.4,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Evidance",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(height: 25, color: Colors.transparent),
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      useSafeArea: true,
                      context: context,
                      builder: (ctx) => Container(
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 20),
                            child: ListView(
                              children: [
                                const Text(
                                  "Kirim Evidance",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 56, 56, 56)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Color.fromARGB(255, 228, 228, 228),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 4),
                                          child: Text(
                                            "Detail",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text("Customer: Fahrul"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child:
                                              Text("Tipe Evidance: Angsuran"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child:
                                              Text("Jatuh tempo: 12 Mei 1998"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 8),
                                  child: Text(
                                    "Pesan",
                                  ),
                                ),
                                const InputField(Icon(Icons.message)),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text(
                                    "Bukti Evidance",
                                  ),
                                ),
                                const MyImagePicker(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 30),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF3D916C)),
                                      onPressed: () {},
                                      child: const Text("Kirim")),
                                )
                              ],
                            ),
                          ));
                },
                child: const ListItemEvidance(),
              ),
              itemCount: 50,
            ),
          )
        ],
      ),
    );
  }
}
