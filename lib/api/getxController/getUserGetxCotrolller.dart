import 'package:get/get.dart';
import 'package:sqflitetestdeloacal/api/model/getuserobjectModel.dart';

import '../repos/getrepo.dart';

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
