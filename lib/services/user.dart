import 'dart:convert';
import 'package:api_toko_online/models/data_map.dart';
import 'package:http/http.dart' as http;
import 'package:api_toko_online/services/url.dart' as url;

class UserService {
  Future<DataMap> registerUser(Map<String, dynamic> data) async {
    var uri = Uri.parse("${url.BaseUrl}/register_admin");
    var response = await http.post(uri, body: data);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return DataMap(
        status: responseData["status"] ?? false,
        message: responseData["message"] ?? "Unknown error",
        data: responseData,
      );
    } else {
      return DataMap(
        status: false,
        message: "Error ${response.statusCode}: Failed to register user",
      );
    }
  }
}
