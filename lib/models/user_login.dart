import 'package:shared_preferences/shared_preferences.dart';

class UserLogin {
  bool? status = false;
  String? token;
  String? message;
  int? id;
  String? nama_user;
  String? email;
  String? role;
  String? Adrees;
  String? phone;
  UserLogin({
    this.status,
    this.token,
    this.message,
    this.id,
    this.nama_user,
    this.email,
    this.role,
    this.Adrees,
    this.phone,
  });

    Future prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("status", status!);
    prefs.setString("token", token!);
    prefs.setString("message", message!);
    prefs.setInt("id", id!);
    prefs.setString("nama_user", nama_user!);
    prefs.setString("email", email!);
    prefs.setString("role", role!);
    prefs.setString("Adrees", Adrees!);
    prefs.setString("phone", phone!);
  }

  Future getUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserLogin userLogin = UserLogin(
        status: prefs.getBool("status")!,
        token: prefs.getString("token")!,
        message: prefs.getString("message")!,
        id: prefs.getInt("id")!,
        nama_user: prefs.getString("nama_user")!,
        email: prefs.getString("email")!,
        role: prefs.getString("role")!,
        Adrees: prefs.getString("Adrees")!,
        phone: prefs.getString("phone")!);
    return userLogin;
  }
}

