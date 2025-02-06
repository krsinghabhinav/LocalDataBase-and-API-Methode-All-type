import 'dart:convert';
import 'package:sqflitetestdeloacal/api/getAPIMethod/model(getapi)/getuserobjectModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<Getuserobjectmodel?> getUserObjectModel(String page) async {
    try {
      String url = "https://reqres.in/api/users?page=$page";
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Getuserobjectmodel.fromJson(data);
      } else {
        throw Exception(
            "Failed to load API, Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      return null; // Ensure that the return type allows null values
    }
  }
}
