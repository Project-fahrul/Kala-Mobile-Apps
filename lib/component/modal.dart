import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  const Modal(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFFf8d7da),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xfff5c2c7))),
      height: 52,
      child: Text(
        message,
        style: const TextStyle(color: Color(0xFF842029), fontSize: 16),
      ),
    );
  }
}
