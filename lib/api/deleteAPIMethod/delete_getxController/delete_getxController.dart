import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflitetestdeloacal/api/deleteAPIMethod/deleteRepo/delete_Repo.dart';
import 'package:sqflitetestdeloacal/api/deleteAPIMethod/delete_model/delete_Model.dart';

class DeleteGetxcontroller extends GetxController {
  DeleteRepo deleteRepo = DeleteRepo();
  var isLoading = false.obs;
  var deleteModel = DeleteModel().obs;
  TextEditingController deleteController = TextEditingController();
  Future<void> deleteDataUser(String deleteuserId) async {
    try {
      isLoading.value = true;
      final response = await deleteRepo.deleteData(deleteuserId);
      deleteModel.value = response!;

      // Show success snackbar
      Get.snackbar(
        "Success",
        "Data deleted successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      isLoading.value = false;
    } on Exception catch (e) {
      isLoading.value = false;

      // Show error snackbar
      Get.snackbar(
        "Error",
        "Failed to delete data: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
