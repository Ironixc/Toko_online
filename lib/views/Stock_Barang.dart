import 'package:api_toko_online/widgets/NavBar.dart';
import 'package:flutter/material.dart';

class Stockbarang extends StatefulWidget {
  const Stockbarang({super.key});

  @override
  State<Stockbarang> createState() => _StockbarangState();
}

class _StockbarangState extends State<Stockbarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Barang"),
      ),
      body: Text("data"),
            bottomNavigationBar: Navbar(1),

    );
  }
}