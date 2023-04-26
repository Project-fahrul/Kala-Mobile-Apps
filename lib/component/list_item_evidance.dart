import 'package:customer_retention/model/evidance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListItemEvidance extends StatelessWidget {
  ListItemEvidance(this.evidanceModel, {super.key});
  EvidanceModel evidanceModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  evidanceModel.customerName,
                  style: const TextStyle(
                    color: Color(0xFF030303),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  children: [
                    const Icon(
                      Icons.mark_as_unread_sharp,
                      size: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                      ),
                      child: Text(
                        "${evidanceModel.evidanceType} - Jatuh Tempo ${evidanceModel.deadLine.year}-${evidanceModel.deadLine.month}-${evidanceModel.deadLine.day}",
                        style: const TextStyle(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Icon(Icons.check_circle_outline_outlined,
              color: evidanceModel.isUploaded == 0
                  ? const Color(0xFFE0E0E0)
                  : const Color(0xFF3C8F6C))
        ],
      ),
    );
  }
}
