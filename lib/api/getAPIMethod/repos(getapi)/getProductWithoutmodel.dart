import 'package:sqflitetestdeloacal/api/baseurl/baseapiurl.dart';
import 'package:sqflitetestdeloacal/api/getAPIMethod/model(getapi)/getProductModel.dart';
import 'package:sqflitetestdeloacal/api/serverhepler/apihelperserver.dart';

class GetproductlistWithoutModelRepo {
  Apihelperserver apihelperserver = Apihelperserver();

  Future<dynamic> getProductRepo() async {
    try {
      String url = Baseapiurl.getProducturl;
      final response = await apihelperserver.getAPI(url);
      List<dynamic> data = response as List<dynamic>;

      print("URL: $url");
      print("Data: $data");

      return data;
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
