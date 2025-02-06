import 'package:sqflitetestdeloacal/api/postAPIMethod/model(postapi)/PostCreateJobModel.dart';
import '../../baseurl/baseapiurl.dart';
import '../../serverhepler/apihelperserver.dart';

class PostapiCreateJobWithoutModelrepo {
  Apihelperserver apihelper = Apihelperserver();

  Future<dynamic> fetchPostCreateJobwithoutmodel(Object requestBody) async {
    try {
      final String url = Baseapiurl.postCreateJobturl;
      final response = await apihelper.postAPI(url, requestBody);
      final data = response;
      print("URL: $url");
      print("Data: $data");
      return data;
    } catch (e) {
      print("Error in fetchUserData: $e");
      return null;
    }
  }
}
