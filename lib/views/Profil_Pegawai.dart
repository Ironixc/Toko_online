import 'package:api_toko_online/widgets/NavBar.dart';
import 'package:flutter/material.dart';

class ProfilPegawai extends StatefulWidget {
  const ProfilPegawai({super.key});

  @override
  State<ProfilPegawai> createState() => _ProfilPegawaiState();
}

class _ProfilPegawaiState extends State<ProfilPegawai> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Profil Pegawai"),
      ),
      body: Text("data"),
      bottomNavigationBar: Navbar(2),
    );
  }
}