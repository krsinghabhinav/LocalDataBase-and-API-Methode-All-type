

import '../../baseurl/baseapiurl.dart';
import '../../serverhepler/apihelperserver.dart';
import '../putpetch_model/putApiModel.dart';



class Putapirepo {
  Apihelperserver apihelperserver = Apihelperserver();

  Future<putApiModel?> fetchPutApiRepo(
      Object requestbody, String userid) async {
    try {
      String url = Baseapiurl.putUrl + userid; // Append the user ID to the URL
      final response = await apihelperserver.putAPI(
        url,
        requestbody,
      );

      // Assuming the response is a JSON object, convert it to a putApiModel
      var data = putApiModel.fromJson(response);
      print("URL: $url");
      print("Data: $data");
      return data;
    } on Exception catch (e) {
      print("Error during PUT request: $e");
      return null; // Return null or handle as needed
    }
  }
}
