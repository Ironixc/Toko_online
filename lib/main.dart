import 'package:api_toko_online/views/SignUp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp (
    initialRoute: '/',
    routes: {
      '/': (context) => Signup(),
    },
  ));
}
