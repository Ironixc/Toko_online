import 'package:api_toko_online/models/user_login.dart';
import 'package:api_toko_online/widgets/NavBar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserLogin userLogin = UserLogin();
  String? nama;
  String? role;
  getUserLogin() async{
    var user = await userLogin.getUserLogin();
    if (user.status != false){
      setState(() {
        nama = user.nama_user;
        role = user.role;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(child: Text("Selamat Datang $nama role anda $role")),
      bottomNavigationBar: Navbar(0),
    );
  }
}