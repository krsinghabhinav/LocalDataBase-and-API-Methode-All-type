import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflitetestdeloacal/api/put_petch_API_Method/putpetch_model/putApiModel.dart';

import '../putpetch_repo/putApiRepo.dart';

class PutPetchController extends GetxController {
  Putapirepo repo = Putapirepo();

  var putdataChange = putApiModel().obs;
  var isLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController idController = TextEditingController();

  Future<void> putUpdateDataGetx(Object requestbody, String userid) async {
    try {
      isLoading.value = true;
      final response = await repo.fetchPutApiRepo(requestbody, userid);
      putdataChange.value = response!;
      isLoading.value = false;
    } on Exception catch (e) {
      isLoading.value = false;
      print('Error: $e');
    }
  }
}
