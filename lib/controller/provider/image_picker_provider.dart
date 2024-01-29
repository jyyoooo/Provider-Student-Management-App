import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  File image = File('');

  Future pickImageFromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage == null) {
        return;
      }
      final imageTemp = File(pickedImage.path);
      image = imageTemp;
      notifyListeners();
    } on PlatformException catch (e) {
      return e;
    }
  }
}
