import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../image_getxController/uploadimage_with_getxController.dart';

class UplodimageGetxUi extends StatefulWidget {
  const UplodimageGetxUi({super.key});

  @override
  State<UplodimageGetxUi> createState() => _UplodimageGetxUiState();
}

class _UplodimageGetxUiState extends State<UplodimageGetxUi> {
  final UploadimageWithGetxcontroller controller =
      Get.put(UploadimageWithGetxcontroller());

  @override
  Widget build(BuildContext context) {
    print("location====== ${controller.imageModel.value.location}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image API Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: Obx(() {
                if (controller.isloading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.selectedImage.value != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      File(controller
                          .selectedImage.value!.path), // Convert XFile to File
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://www.w3schools.com/w3images/fjords.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                }
              }),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await controller.selectImage();
              if (controller.selectedImage.value != null) {
                controller.uploadImage();
              }
              print("location====== ${controller.imageModel.value.location}");
            },
            child: const Text("Upload Image"),
          ),
        ],
      ),
    );
  }
}
