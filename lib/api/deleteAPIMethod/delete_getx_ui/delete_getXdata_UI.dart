import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../delete_getxController/delete_getxController.dart';

class DeleteGetxdataUi extends StatefulWidget {
  const DeleteGetxdataUi({super.key});

  @override
  State<DeleteGetxdataUi> createState() => _DeleteGetxdataUiState();
}

class _DeleteGetxdataUiState extends State<DeleteGetxdataUi> {
  DeleteGetxcontroller controller = Get.put(DeleteGetxcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: controller.deleteController,
              decoration: const InputDecoration(
                labelText: 'Enter ID to Delete',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Delete the user data by passing the ID from the TextField
                controller.deleteDataUser(controller.deleteController.text);
              },
              child: const Text("Delete"),
            ),
            // Use Obx to make the deleteModel reactive
            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator(); // Show loading indicator while deleting
              }
              if (controller.deleteModel.value != null) {
                return Card(
                  child: ListTile(
                    title: const Text("Job Deleted"),
                    subtitle: Text(
                      "ID: ${controller.deleteModel.value!.id}\n"
                      "Title: ${controller.deleteModel.value!.title}\n"
                      "Price: ${controller.deleteModel.value!.price}\n"
                      "Rating: ${controller.deleteModel.value!.rating}\n"
                      "Description: ${controller.deleteModel.value!.description}",
                    ),
                  ),
                );
              }
              return const SizedBox(); // Return an empty box if no data is available
            }),
          ],
        ),
      ),
    );
  }
}
