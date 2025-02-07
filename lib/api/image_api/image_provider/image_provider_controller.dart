import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflitetestdeloacal/api/image_api/image_Models/image_Model.dart';

import '../../serverhepler/apihelperserver.dart';
import '../image_repo/image_Repo.dart';

class ImageProviderController extends ChangeNotifier {
  Apihelperserver apihelper = Apihelperserver();
  ImageRepo imageRepo = ImageRepo();
    final ImagePicker _imagePicker = ImagePicker();
    XFile? selectedImage;
    bool isloading = false;
    ImageModel? imageModel;

    // Select image from gallery
    Future<void> selectImage() async {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage = image;
        notifyListeners();
      }
    }

  // Upload selected image
  Future<void> uploadImageserver(File imageFile) async {
    try {
      isloading = true;
      notifyListeners();

      imageModel = await imageRepo.selectimage(imageFile);

      if (imageModel != null) {
        print("✅ Image uploaded successfully: ${imageModel!.toJson()}");
      } else {
        print("⚠️ Error: Image upload failed.");
      }
    } catch (e) {
      print("❌ Error in fetchPostCreateJob: $e");
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
