import 'package:sqflitetestdeloacal/api/baseurl/baseapiurl.dart';
import 'package:sqflitetestdeloacal/api/getAPIMethod/model(getapi)/getProductModel.dart';
import 'package:sqflitetestdeloacal/api/serverhepler/apihelperserver.dart';

class Getproductlistrepo {
  Apihelperserver apihelperserver = Apihelperserver();

  Future<List<getProductModel>?> getProductRepo() async {
    try {
      String url = Baseapiurl.getProducturl;
      final response = await apihelperserver.getAPI(url);
      List<dynamic> data = response as List<dynamic>;
      List<getProductModel> productlist =
          data.map((element) => getProductModel.fromJson(element)).toList();
      print("URL: $url");
      print("Data: $data");
    

      return productlist;
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
