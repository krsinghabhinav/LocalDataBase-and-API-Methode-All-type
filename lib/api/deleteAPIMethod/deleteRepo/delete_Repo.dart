import 'package:sqflitetestdeloacal/api/baseurl/baseapiurl.dart';
import 'package:sqflitetestdeloacal/api/deleteAPIMethod/delete_model/delete_Model.dart';
import 'package:sqflitetestdeloacal/api/serverhepler/apihelperserver.dart';

class DeleteRepo {
  Apihelperserver apihelperserver = Apihelperserver();

  Future<DeleteModel?> deleteData(String deleteId) async {
    try {
      String url = "${Baseapiurl.deleteUrl}$deleteId"; // Proper URL formatting
      final response = await apihelperserver.deleteAPI(url);
      var data = DeleteModel.fromJson(response);
      print("URL: $url");
      print("Data: $data");
      return data;
    } on Exception catch (e) {
      print('Error: $e');
    }
  }
}
