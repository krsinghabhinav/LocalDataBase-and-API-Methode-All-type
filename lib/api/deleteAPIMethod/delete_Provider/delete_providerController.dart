import 'package:flutter/material.dart';
import 'package:sqflitetestdeloacal/api/deleteAPIMethod/deleteRepo/delete_Repo.dart';
import 'package:sqflitetestdeloacal/api/deleteAPIMethod/delete_model/delete_Model.dart';

class DeleteProvidercontroller extends ChangeNotifier {
  DeleteRepo deleteRepo = DeleteRepo();
  bool isLoading = false;
  String? deletedId; // Store deleted ID
  TextEditingController deleteController = TextEditingController();

  Future<void> deleteUserId(String deleteId) async {
    try {
      isLoading = true;
      deletedId = null; // Reset previous deleted ID
      notifyListeners();

      await deleteRepo.deleteData(deleteId);
      deletedId = deleteId; // Store deleted ID
      isLoading = false;
      deleteController.clear(); // Clear text field after deletion
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
    }
  }
}







