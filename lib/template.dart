import 'package:customer_retention/component/customer_fragment.dart';
import 'package:customer_retention/component/evidance_container.dart';
import 'package:customer_retention/component/evidance_date.dart';
import 'package:customer_retention/component/profile_fragment.dart';
import 'package:flutter/material.dart';

class TemplateApp extends StatefulWidget {
  const TemplateApp({super.key});

  @override
  State<TemplateApp> createState() => _TemplateAppState();
}

class _TemplateAppState extends State<TemplateApp> {
  bool search = false, memberPage = false;
  int index = 0;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !search
            ? const Text("Customer Retention")
            : Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            textEditingController.clear();
                            setState(() {
                              search = !search;
                            });
                          },
                        ),
                        hintText: 'Cari Customer...',
                        border: InputBorder.none),
                    onSubmitted: (d) {},
                    controller: textEditingController,
                  ),
                ),
              ),
        actions: [
          if (!search && index < 2)
            IconButton(
                onPressed: () {
                  setState(() {
                    search = !search;
                  });
                },
                icon: const Icon(Icons.search))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Customer"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: index,
        onTap: (v) => setState(() {
          index = v;
        }),
      ),
      body: Container(
        color: Color(0xFFF2F2F2),
        alignment: search ? Alignment.center : Alignment.topLeft,
        // child: Image.asset("assets/image/search_empty.png"), search empty
        child: Column(
          children: [
            if (index == 0)
              const Padding(
                  padding: EdgeInsets.only(bottom: 5), child: EvidanceDate()),
            if (index == 0) const Expanded(child: EvidanceContainer()),
            if (index == 1) Expanded(child: const CustomerFragment()),
            if (index == 2) Expanded(child: const ProfileFragment())
          ],
        ),
      ),
    );
  }
}
