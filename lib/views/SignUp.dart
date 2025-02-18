import 'package:api_toko_online/services/user.dart';
import 'package:flutter/material.dart';
import 'package:api_toko_online/widgets/alert.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  UserService userService = UserService();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Adrees = TextEditingController();
  TextEditingController phone = TextEditingController();
  List<String> roleChoices = ["Pegawai", "Pelanggan"];
  String? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up User"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                icon: Icon(Icons.add))
          ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                "Register User",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(label: Text("Name")),
                      validator: (value) {
                        if (value!.isEmpty) return 'Name is required';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(label: Text("Email")),
                      validator: (value) {
                        if (value!.isEmpty) return 'Email is required';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: Adrees,
                      decoration: InputDecoration(label: Text("Adrees")),
                      validator: (value) {
                        if (value!.isEmpty) return 'Adrees is required';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: phone,
                      decoration: InputDecoration(label: Text("Phone Number")),
                      validator: (value) {
                        if (value!.isEmpty) return 'Phone number is required';
                        return null;
                      },
                    ),
                    DropdownButtonFormField(
                      isExpanded: true,
                      value: role,
                      items: roleChoices.map((r) {
                        return DropdownMenuItem(value: r, child: Text(r));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          role = value.toString();
                        });
                      },
                      hint: Text("Select Role"),
                      validator: (value) {
                        if (value == null) return 'Role is required';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(label: Text("Password")),
                      validator: (value) {
                        if (value!.isEmpty) return 'Password is required';
                        return null;
                      },
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          var data = {
                            "name": name.text,
                            "email": email.text,
                            "Adrees": Adrees.text,
                            "phone": phone.text,
                            "role": role,
                            "password": password.text,
                          };

                          var result = await userService.registerUser(data);
                          print("API Result: ${result.status} - ${result.message}");

                          if (result.status == true) {
                            name.clear();
                            email.clear();
                            password.clear();
                            Adrees.clear();
                            phone.clear();
                            setState(() {
                              role = null;
                            });
                            AlertMessage().showAlert(context, result.message, true);
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.pushReplacementNamed(context, '/login');
                            });
                          } else {
                            AlertMessage().showAlert(context, result.message, false);
                          }
                        }
                      },
                      child: Text("Register"),
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
