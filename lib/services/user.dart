import 'package:api_toko_online/models/data_map.dart';
import 'package:http/http.dart' as http;
import 'package:api_toko_online/services/url.dart' as url;
import 'dart:convert';

class UserService {
  Future registerUser(data) async {
    var uri = Uri.parse(url.BaseUrl + "/register_admin");
    var register = await http.post(uri, body: data);


    if (register.statusCode == 200) {
      var data = json.decode(register.body);
      if (data["status"] == true) {
        DataMap response = DataMap(
            status: true, message: "Sukses menambah user", data: data);
        return response;
      } else {
        var message = '';
        for (String key in data["message"].keys) {
          message += data["message"][key][0].toString() + '\n';
        }
        DataMap response =
            DataMap(status: false, message: message);
        return response;
      }
    } else {
      DataMap response = DataMap(
          status: false,
          message:
              "gagal menambah user dengan code error ${register.statusCode}");
      return response;
    }
  }
}