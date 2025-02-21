  import 'dart:convert';
  import 'package:api_toko_online/models/data_map.dart';
  import 'package:api_toko_online/models/user_login.dart';
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
  Future loginUser(data) async {
    var uri = Uri.parse(url.BaseUrl + "/login");
    var loginUser = await http.post(uri, body: data);

    if (loginUser.statusCode == 200) {
      var responseData = json.decode(loginUser.body);

      if (responseData["status"] == true) {
        var user = responseData["data"];
        var tokenData = responseData["authorisation"];

        if (user == null || tokenData == null) {
          return DataMap(status: false, message: "User data or token missing in response");
        }

        UserLogin userLogin = UserLogin(
          status: responseData["status"],
          token: tokenData["token"],
          message: responseData["message"] ?? "Login successful",
          id: user["id"] ?? 0, 
          nama_user: user["name"] ?? "Unknown",
          email: user["email"] ?? "",
          role: user["role"] ?? "",
          Adrees: user["Adrees"]??"",
          phone: user["phone"]??"",
        );

        await userLogin.prefs();
        return DataMap(status: true, message: "Login successful", data: responseData);
      } else {
        return DataMap(status: false, message: "Invalid email or password");
      }
    } else {
      return DataMap(status: false, message: "Error ${loginUser.statusCode} occurred");
    }
  }
  }