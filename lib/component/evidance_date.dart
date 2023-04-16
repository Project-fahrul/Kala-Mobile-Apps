import 'package:customer_retention/model/dao/template_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EvidanceDate extends StatefulWidget {
  EvidanceDate(this.templateModel, {super.key});
  TemplateModel? templateModel;
  @override
  State<EvidanceDate> createState() => _EvidanceDateState();
}

class _EvidanceDateState extends State<EvidanceDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.date_range,
                        color: Color(0xFFFEC042),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Evidance",
                          style: TextStyle(
                              color: Color.fromARGB(255, 66, 66, 66),
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Hari ini",
                            style: TextStyle(
                                color: Color.fromARGB(255, 83, 83, 83)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        "Selamat datang,",
                        style:
                            TextStyle(color: Color.fromARGB(255, 44, 44, 44)),
                      ),
                    ),
                    Text(
                      widget.templateModel == null
                          ? ""
                          : widget.templateModel!.name,
                      style: TextStyle(
                          color: Color(0xFF3D916C),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
