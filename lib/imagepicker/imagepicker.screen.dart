
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  XFile? photo;

  Future getImageFromCamera() async {
    photo = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {});
  }

  Future getImageFromGallery() async {
    photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              getImageFromCamera();
            },
            child: const Text("picker camera"),
          ),
          ElevatedButton(
            onPressed: () {
              getImageFromGallery();
            },
            child: const Text("picker gallery"),
          ),
          const SizedBox(
            height: 50,
          ),
          photo == null
              ? const Icon(Icons.image)
              : Image.file(
                  File(photo!.path),
                  width: 100,
                  height: 100,
                )
        ],
      ),
    ));
  }
}