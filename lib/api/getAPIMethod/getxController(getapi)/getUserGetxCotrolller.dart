import 'package:get/get.dart';
import 'package:sqflitetestdeloacal/api/getAPIMethod/model(getapi)/getuserobjectModel.dart';

import '../repos(getapi)/getUserObjectrepo.dart';

class Getusergetxcotrolller extends GetxController {
  GetUserDataRepo getuserdata = GetUserDataRepo();
  var isloading = false.obs;
  var getuserda = Getuserobjectmodel().obs;

  Future<void> fetchGetUserData(String page) async {
    try {
      isloading.value = true;
      var data = await getuserdata.fetchUserData(page);
      getuserda.value = data!;
      isloading.value = false;
    } catch (e) {
      isloading.value = false;

      print(e);
    }
  }
}
