import 'package:flutter/material.dart';
import '../repo(postapi)/postapiRepo.dart';
import '../model(postapi)/PostCreateJobModel.dart';

class Postapicreateprovider extends ChangeNotifier {
  final PostapiCreateJobRepo getrepo = PostapiCreateJobRepo();
  bool isloading = false;
  PostCreateJobModel? userData;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  var isLoading;
  Future<void> fetchPostCreateJob(Object requestBody) async {
    try {
      isloading = true;
      notifyListeners();

      // Map<String, dynamic> requestBody = {
      //   "name": nameController.text,
      //   "job": jobController.text,
      // };

      print("Fetching user data with requestBody: $requestBody");
      userData = await getrepo.fetchPostCreateJob(requestBody);

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
