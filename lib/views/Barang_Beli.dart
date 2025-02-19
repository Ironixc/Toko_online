import 'package:api_toko_online/widgets/NavBar.dart';
import 'package:flutter/material.dart';

class Barangbeli extends StatefulWidget {
  const Barangbeli({super.key});

  @override
  State<Barangbeli> createState() => _BarangbeliState();
}

class _BarangbeliState extends State<Barangbeli> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Beli"),
      ),
      body: Text("data"),
          bottomNavigationBar: Navbar(1),

    );
  }
}