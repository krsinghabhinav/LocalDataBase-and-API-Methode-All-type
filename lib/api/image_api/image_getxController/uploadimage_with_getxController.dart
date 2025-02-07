import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../image_Models/image_Model.dart';
import '../image_repo/image_Repo.dart';

class UploadimageWithGetxcontroller extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  final ImageRepo imageRepo = ImageRepo();

  var selectedImage = Rx<XFile?>(null); // Reactive variable
  var isloading = false.obs;
  var imageModel = ImageModel().obs;

  // Select image from gallery
  Future<void> selectImage() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image;
    }
  }

  // Upload selected image
  Future<void> uploadImage() async {
    if (selectedImage.value == null) {
      print("No image selected.");
      return;
    }

    try {
      isloading.value = true;
      var response =
          await imageRepo.selectimage(File(selectedImage.value!.path));
      imageModel.value = response!;
      print("Uploaded Image Data: ${imageModel.value}");
    } catch (e) {
      print("Error occurred: $e");
    } finally {
      isloading.value = false;
    }
  }
}
