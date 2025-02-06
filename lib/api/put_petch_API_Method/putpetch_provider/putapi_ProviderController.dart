import 'package:flutter/material.dart';
import 'package:sqflitetestdeloacal/api/put_petch_API_Method/putpetch_Provider_ui/put_petch_createjob_UI.dart';
import 'package:sqflitetestdeloacal/api/put_petch_API_Method/putpetch_model/putApiModel.dart';

import '../putpetch_repo/putApiRepo.dart';

class PutapiProvidercontroller extends ChangeNotifier {
  Putapirepo putapirepo = Putapirepo();
  putApiModel? userUpdateData;
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController idController = TextEditingController();
  Future<void> putUpdateData(Object requestBody, String userid) async {
    try {
      isLoading = true;
      notifyListeners();
      userUpdateData = await putapirepo.fetchPutApiRepo(requestBody, userid);
      
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('error $e');
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
