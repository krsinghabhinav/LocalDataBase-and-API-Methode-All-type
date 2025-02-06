import 'package:sqflitetestdeloacal/api/postAPIMethod/model(postapi)/PostCreateJobModel.dart';
import '../../baseurl/baseapiurl.dart';
import '../../serverhepler/apihelperserver.dart';

class PostapiCreateJobRepo {
  Apihelperserver apihelper = Apihelperserver();

  Future<PostCreateJobModel?> fetchPostCreateJob(Object requestBody) async {
    try {
      final String url = Baseapiurl.postCreateJobturl;
      final response = await apihelper.postAPI(url, requestBody);
      final data = PostCreateJobModel.fromJson(response);
      print("URL: $url");
      print("Data: $data");
      return data;
    } catch (e) {
      print("Error in fetchUserData: $e");
      return null;
    }
  }
}
