import 'package:flutter/material.dart';
import '../repo(postapi)/postapiRepo.dart';
import '../model(postapi)/PostCreateJobModel.dart';
import '../repo(postapi)/postapiRepoWithoutModel.dart';

class PostapicreateWithoutModelprovider extends ChangeNotifier {
  final PostapiCreateJobWithoutModelrepo getrepo =
      PostapiCreateJobWithoutModelrepo();
  bool isloading = false;
  dynamic userData;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  var isLoading;
  Future<void> fetchPostCreateJobWithoutModel(Object requestBody) async {
    try {
      isloading = true;
      notifyListeners();

      // Map<String, dynamic> requestBody = {
      //   "name": nameController.text,
      //   "job": jobController.text,
      // };

      print("Fetching user data with requestBody: $requestBody");
      userData = await getrepo.fetchPostCreateJobwithoutmodel(requestBody);

      print("API Response: ${userData?.toJson()}");
      isloading = false;
      notifyListeners();
    } catch (e) {
      isloading = false;
      notifyListeners();
      print("Error fetching user data: $e");
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  // Dispose controllers to prevent memory leaks
  @override
  void dispose() {
    nameController.dispose();
    jobController.dispose();
    super.dispose();
  }
}
