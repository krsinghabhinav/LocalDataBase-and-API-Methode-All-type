import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../image_provider/image_provider_controller.dart';

class ImageApiProviderUi extends StatefulWidget {
  const ImageApiProviderUi({super.key});

  @override
  State<ImageApiProviderUi> createState() => _ImageApiProviderUiState();
}

class _ImageApiProviderUiState extends State<ImageApiProviderUi> {
  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProviderController>(context);

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
              child: imageProvider.isloading == true
                  ? const Center(child: CircularProgressIndicator())
                  : imageProvider.selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            File(imageProvider.selectedImage!.path),
                            fit: BoxFit
                                .cover, // Ensures the image covers the entire box
                            width: double
                                .infinity, // Takes full width of the container
                            height: double
                                .infinity, // Takes full height of the container
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://www.w3schools.com/w3images/fjords.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await imageProvider.selectImage();
              if (imageProvider.selectedImage != null) {
                imageProvider
                    .uploadImageserver(File(imageProvider.selectedImage!.path));
              }
            },
            child: const Text("Upload Image"),
          ),
        ],
      ),
    );
  }
}
