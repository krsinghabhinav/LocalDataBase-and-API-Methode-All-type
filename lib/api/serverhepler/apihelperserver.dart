import 'dart:convert';
import 'package:http/http.dart' as http;

class Apihelperserver {
  Future<dynamic> getdata(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print("Response Status Code: ${response.statusCode}");
      print("URL: $url");
      print("Response Body: ${response.body}");
      return _returnResponse(response);
    } catch (e) {
      return {"error": "Failed to fetch data", "message": e.toString()};
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw Exception("Bad request");
      case 404:
        throw Exception("Not found");
      case 500:
        throw Exception("Internal server error");
      default:
        throw Exception("Error: ${response.statusCode}");
    }
  }
}
