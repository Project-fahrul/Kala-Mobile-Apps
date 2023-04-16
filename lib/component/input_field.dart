import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField(this._icon, {super.key, this.isPassword = false, this.controller});
  Icon _icon;
  TextEditingController? controller;
  bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xFF333333))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              icon: _icon,
              iconColor: const Color(0xFFEDB861)),
        ),
      ),
    );
  }
}
