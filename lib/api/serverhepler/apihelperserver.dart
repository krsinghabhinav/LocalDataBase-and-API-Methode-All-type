import 'dart:convert';
import 'package:http/http.dart' as http;

class Apihelperserver {
  Future<dynamic> getAPI(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          // "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
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

  // POST API Request
  Future<dynamic> postAPI(String url, Object? requestBody) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          // "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
        },
        body: jsonEncode(requestBody),
      );
      print("POST Request - URL: $url");
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      return _returnResponse(response);
    } catch (e) {
      return {"error": "Failed to post data", "message": e.toString()};
    }
  }

  // PUT API Request
  Future<dynamic> putAPI(String url, Object? requestBody) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          // "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...", // Uncomment if needed
        },
        body: jsonEncode(requestBody),
      );
      print("PUT Request - URL: $url");
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      return _returnResponse(response);
    } catch (e) {
      return {"error": "Failed to put data", "message": e.toString()};
    }
  }

//the process are put and patch  same
  // PATCH API Request (Partial Update)
  Future<dynamic> patchAPI(String url, Object? requestBody) async {
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );
      print("PATCH Request - URL: $url");
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      return _returnResponse(response);
    } catch (e) {
      return {"error": "Failed to patch data", "message": e.toString()};
    }
  }

  // ✅ DELETE API Request (Newly Added)
  Future<dynamic> deleteAPI(String url) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print("DELETE Request - URL: $url");
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      return _returnResponse(response);
    } catch (e) {
      return {"error": "Failed to delete data", "message": e.toString()};
    }
  }

  // Unified response handler
  dynamic _returnResponse(http.Response response) {
    try {
      switch (response.statusCode) {
        case 200:
        case 201:
          return jsonDecode(response.body);
        case 400:
          return {"error": "Bad request", "message": response.body};
        case 404:
          return {"error": "Not found", "message": response.body};
        case 500:
          return {"error": "Internal server error", "message": response.body};
        default:
          return {
            "error": "Unexpected error",
            "code": response.statusCode,
            "message": response.body
          };
      }
    } catch (e) {
      return {"error": "Failed to parse response", "message": e.toString()};
    }
  }
}
