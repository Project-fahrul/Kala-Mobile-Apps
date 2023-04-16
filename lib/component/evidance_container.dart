import 'package:customer_retention/component/input_field.dart';
import 'package:customer_retention/component/list_item_evidance.dart';
import 'package:customer_retention/component/my_image_picker.dart';
import 'package:customer_retention/model/dao/evidance_response.dart';
import 'package:customer_retention/model/evidance_model.dart';
import 'package:flutter/material.dart';

class EvidanceContainer extends StatefulWidget {
  EvidanceContainer(this.data, this.textSearch, {super.key});
  EvidanceResponse data;
  String textSearch;

  @override
  State<EvidanceContainer> createState() => _EvidanceContainerState();
}

class _EvidanceContainerState extends State<EvidanceContainer> {
  String filterEvidance = "Semua";
  List<String> filters = ["Semua", "Belum Terkirim", "Terkirim"];

  @override
  Widget build(BuildContext context) {
    List<EvidanceModel> dataFilter = widget.data.evidances
        .where((element) => filterEvidance == "Semua"
            ? true
            : filterEvidance == "Terkirim"
                ? element.isUploaded
                : !element.isUploaded)
        .where((element) => widget.textSearch == ""
            ? true
            : element.customerName.contains(widget.textSearch))
        .toList();
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
                children: [
                  const Text("Progres anda"),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "${widget.data.progress}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              PopupMenuButton(
                  initialValue: filterEvidance,
                  itemBuilder: (_) => filters
                      .map((e) => PopupMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  child: Row(
                    children: [
                      Text(filterEvidance),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                  onSelected: (v) {
                    setState(() {
                      filterEvidance = v;
                    });
                  })
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
            child: RefreshIndicator(
              onRefresh: () async {},
              child: dataFilter.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/image/search_empty.png"),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) =>
                          const Divider(height: 25, color: Colors.transparent),
                      itemBuilder: (ctx, i) => GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              useSafeArea: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (ctx) => ListView(
                                    children: [
                                      Container(
                                          color: Color(0xFFF5C056),
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 17, horizontal: 24),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                "Kirim Evidance",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10,
                                            top: 10,
                                            left: 18,
                                            right: 18),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Color.fromARGB(
                                                255, 228, 228, 228),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 4),
                                                child: Text(
                                                  "Detail",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                    "Customer: ${dataFilter.elementAt(i).customerName}"),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                    "Tipe Evidance: ${dataFilter.elementAt(i).evidanceType}"),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                    "Jatuh tempo: ${dataFilter.elementAt(i).deadLine.year}-${dataFilter.elementAt(i).deadLine.month}-${dataFilter.elementAt(i).deadLine.day}"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 8,
                                            left: 18,
                                            right: 18),
                                        child: Text(
                                          "Pesan",
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: InputField(Icon(Icons.message)),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 18,
                                            right: 18),
                                        child: Text(
                                          "Bukti Evidance",
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: MyImagePicker(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 30,
                                            left: 18,
                                            right: 18),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xFF3D916C)),
                                            onPressed: () {},
                                            child: const Text("Kirim")),
                                      )
                                    ],
                                  ));
                        },
                        child: ListItemEvidance(dataFilter.elementAt(i)),
                      ),
                      itemCount: dataFilter.length,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
