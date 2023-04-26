// ignore_for_file: argument_type_not_assignable_to_error_handler

import 'dart:typed_data';

import 'package:customer_retention/model/evidance_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  MyImagePicker(this.imageByte, {super.key, this.link});
  ImageByte imageByte;
  String? link;

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class ImageByte {
  ImageByte(this.file);
  XFile? file;
}

class _MyImagePickerState extends State<MyImagePicker> {
  bool imageSelected = false, error = false;
  ImagePicker picker = ImagePicker();
  Uint8List? _image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.link != null) return;
            picker
                .pickImage(source: ImageSource.gallery)
                .then((file) => file == null
                    ? setState(() {
                        error = true;
                      })
                    : setState(() {
                        widget.imageByte.file = file;
                        file.readAsBytes().then((value) {
                          _image = value;
                        }).catchError((e) {
                          // ignore: avoid_print
                          print(e.toString());
                        });
                      }))
                .catchError(() => setState(() {
                      error = true;
                    }));
          },
          child: Container(
              alignment: Alignment.center,
              height: 200,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color(0xFF3D916C)),
                  borderRadius: BorderRadius.circular(4)),
              child: widget.link != null
                  ? Image.network(widget.link!)
                  : _image == null
                      ? Text(!error
                          ? "Gambar belum dipilih,\nKetuk untuk memilih"
                          : "Opps Ada kesalah load image. Mohon ulangi.")
                      : Image.memory(
                          _image!,
                          height: double.infinity,
                        )),
        ),
      ],
    );
  }
}
