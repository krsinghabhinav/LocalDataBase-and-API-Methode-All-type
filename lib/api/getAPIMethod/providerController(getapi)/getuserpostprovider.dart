import 'package:flutter/material.dart';
import '../model(getapi)/getuserobjectModel.dart';
import '../repos(getapi)/getUserObjectrepo.dart';

class Getuserpostprovider extends ChangeNotifier {
  GetUserDataRepo getrepo = GetUserDataRepo();
  bool isloading = false;
  Getuserobjectmodel? userData;

  Future<void> getUserData(String page) async {
    try {
      isloading = true;
      notifyListeners();

      userData = await getrepo.fetchUserData(page);

      isloading = false;
      notifyListeners();
    } catch (e) {
      isloading = false;
      notifyListeners();
      print("Error fetching user data: $e");
    }
  }
}
