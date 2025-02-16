import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core.dart';

class ApiService {
  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> postToken(
      String endpoint, String token, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> putToken(
      String endpoint, String token, Map<String, dynamic> body) async {
    final response = await http.put(
      Uri.parse(endpoint),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> putImageToken(
      String endpoint, String token, File imageFile) async {
    print('imagefile :: ${imageFile.path}');
    print('imagefile :: $imageFile');
    final request = http.MultipartRequest("PUT", Uri.parse(endpoint));
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });

    request.files
        .add(await http.MultipartFile.fromPath("file", imageFile.path));

    var streamResponse = await request.send();
    var response = await http.Response.fromStream(streamResponse);

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> get(String endpoint, String token) async {
    final response = await http.get(
      Uri.parse(endpoint),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    return _handleResponse(response);
  }

  _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse is Map<String, dynamic>) {
        print('map response');
        return decodedResponse;
      } else {
        throw Exception("Unexpected response format");
      }
    } else if (response.statusCode == 401) {
      Get.snackbar('Expired', 'Session expired, please login again');
      Get.offAllNamed(AppRoutes.login);
    } else {
      throw Exception("Error :: ${response.statusCode}");
    }
  }
}
