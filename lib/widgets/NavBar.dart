import 'package:api_toko_online/models/user_login.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  int ActivePage;
  Navbar(this.ActivePage);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  UserLogin userLogin = UserLogin();
  String? role;
  DataLogin() async {
    var user = await userLogin.getUserLogin();
    if (user!.status != false) {
      setState(() {
        role = user.role;
      });
    } else {
      Navigator.popAndPushNamed(context, '/login');
    }
  }

  @override
  void initState() {
    super.initState();
    DataLogin();
  }

  void getlink(index) {
    if (role == "pegawai") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/Stock');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/Profil_Pegawai');
      }
    }
    if (role == "pelanggan") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
      if (index == 1) {
        Navigator.pushReplacementNamed(context, '/Beli');
      }
      if (index == 2) {
        Navigator.pushReplacementNamed(context, '/Profil_Pelanggan');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return role == "pegawai"
        ? BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: widget.ActivePage,
            onTap: (index) => {getlink(index)},
            items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.inventory),
                  label: 'Stock',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: 'profil')
              ])
        : role == "pelanggan"
            ? BottomNavigationBar(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                currentIndex: widget.ActivePage,
                onTap: (index) => {getlink(index)},
                items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.inventory),
                      label: 'Beli Barang',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline), label: 'profil')
                  ])
            : Text("");
  }
}
