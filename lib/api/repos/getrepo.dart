  import 'package:sqflitetestdeloacal/api/model/getuserobjectModel.dart';
  import '../baseurl/baseapiurl.dart';
  import '../serverhepler/apihelperserver.dart';

  class GetUserDataRepo {
    Apihelperserver apihelper = Apihelperserver();

    Future<Getuserobjectmodel?> fetchUserData(String page) async {
      try {
        final String url = "${Baseapiurl.getbaseurl}$page";
        final response = await apihelper.getdata(url);
        final data = Getuserobjectmodel.fromJson(response);

        print("URL: $url");
        print("Data: $data");

        return data;
      } catch (e) {
        print("Error in fetchUserData: $e");
        return null;
      }
    }
  }
