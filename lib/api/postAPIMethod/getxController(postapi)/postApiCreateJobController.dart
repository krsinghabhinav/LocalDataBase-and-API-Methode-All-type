import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflitetestdeloacal/api/postAPIMethod/model(postapi)/PostCreateJobModel.dart';

import '../repo(postapi)/postapiRepo.dart';

class Postapicreatejobcontroller extends GetxController {
  PostapiCreateJobRepo repo = PostapiCreateJobRepo();

  var userdata = PostCreateJobModel().obs;
  var isloading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  Future<void> postFetchCreateDataGetx(Object requestBody) async {
    try {
      isloading.value = true;
      var response = await repo.fetchPostCreateJob(requestBody);
      userdata.value = response!;
      print("userdata.value====${userdata.value}");
      isloading.value = false;
    } on Exception catch (e) {
      print("Error occurred: $e");
    }
  }
}
