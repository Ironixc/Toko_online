import 'package:api_toko_online/models/user_login.dart';
import 'package:api_toko_online/widgets/NavBar.dart';
import 'package:flutter/material.dart';

class ProfilPegawai extends StatefulWidget {
  const ProfilPegawai({super.key});

  @override
  State<ProfilPegawai> createState() => _ProfilPegawaiState();
}

class _ProfilPegawaiState extends State<ProfilPegawai> {
  UserLogin userLogin = UserLogin();
  String? nama;
  String? role;
  String? email;
  String? Adrees;
  String? phone;

  getUserLogin() async {
    var user = await userLogin.getUserLogin();
    if (user.status != false) {
      setState(() {
        nama = user.nama_user;
        role = user.role;
        email = user.email;
        Adrees = user.Adrees;
        phone = user.phone;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Pegawai"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.person, size: 40),
              title: Text(nama ?? "Loading...", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text("Role: ${role ?? 'Loading...'}"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email, size: 30),
              title: Text("Email"),
              subtitle: Text(email ?? "Loading..."),
            ),
            ListTile(
              leading: Icon(Icons.location_on, size: 30),
              title: Text("Alamat"),
              subtitle: Text(Adrees ?? "Loading..."),
            ),
            ListTile(
              leading: Icon(Icons.phone, size: 30),
              title: Text("No. Telepon"),
              subtitle: Text(phone ?? "Loading..."),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(2),
    );
  }
}
