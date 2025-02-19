import 'package:api_toko_online/views/Barang_Beli.dart';
import 'package:api_toko_online/views/Login.dart';
import 'package:api_toko_online/views/Profil_Pegawai.dart';
import 'package:api_toko_online/views/Profil_Pelanggan.dart';
import 'package:api_toko_online/views/SignUp.dart';
import 'package:api_toko_online/views/Stock_Barang.dart';
import 'package:api_toko_online/views/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp (
    initialRoute: '/',
    routes: {
      '/': (context) => Signup(),
      '/login': (context) => Login(),
      '/dashboard':(context) => Dashboard(),
      '/Stock':(context) => Stockbarang(),
      '/Beli':(context) => Barangbeli(),
      '/Profil_Pelanggan':(context) => ProfilPelanggan(),
      '/Profil_Pegawai':(context) => ProfilPegawai(),
    },
  ));
}
