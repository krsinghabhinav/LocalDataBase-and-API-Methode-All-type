import 'package:flutter/material.dart';
import 'package:sqflitetestdeloacal/api/deleteAPIMethod/deleteRepo/delete_Repo.dart';
import 'package:sqflitetestdeloacal/api/deleteAPIMethod/delete_model/delete_Model.dart';

class  DeleProviderControllerM1111 extends ChangeNotifier {
  DeleteRepo deleteRepo = DeleteRepo();

  DeleteModel? deletedItem;
  bool isLoading = false;
  TextEditingController deleteController = TextEditingController();
  
  Future<void> deleteUserId(BuildContext context, String deleteId) async {
    try {
      isLoading = true;
      notifyListeners();

      deletedItem = await deleteRepo.deleteData(deleteId);
      isLoading = false;
      notifyListeners();
      
      // Show snackbar after successful deletion
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data deleted successfully!'),
          duration: Duration(seconds: 2),
        ),
      );
    } on Exception catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
      
      // Show snackbar on error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete data. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}