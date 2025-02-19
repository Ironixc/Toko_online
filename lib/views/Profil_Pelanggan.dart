import 'package:api_toko_online/widgets/NavBar.dart';
import 'package:flutter/material.dart';

class ProfilPelanggan extends StatefulWidget {
  const ProfilPelanggan({super.key});

  @override
  State<ProfilPelanggan> createState() => _ProfilPelangganState();
}

class _ProfilPelangganState extends State<ProfilPelanggan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Pelanggan"),
      ),
      body: Text("data"),
            bottomNavigationBar: Navbar(2),

    );
  }
}