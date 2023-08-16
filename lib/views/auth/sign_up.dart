// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, no_logic_in_create_state

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_order/services/database.dart';
import 'package:food_order/utils/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:food_order/views/restaurant%20page/res.scaffold.dart';

import '../../services/auth.dart';
import '../user page/home/home.dart';

class SignUp extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String signUpMethod;
  const SignUp({Key? key, required this.hintText, required this.labelText, required this.signUpMethod}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState(hintText, labelText, signUpMethod);
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _address;

  final String hintText;
  final String labelText;
  final String signUpMethod;

  _SignUpState(this.hintText, this.labelText, this.signUpMethod);

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _address = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Database db = Database();
    Auth auth = Auth();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _username,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: hintText,
                    labelText: labelText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _email,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    hintText: "Enter your email address",
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _address,
                  decoration: InputDecoration(
                    hintText: "Enter your address",
                    labelText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _password,
                  autocorrect: false,
                  obscureText: true,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    hintText: "Create a password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String username = _username.text;
                    String email = _email.text;
                    String password = _password.text;
                    String address = _address.text;
                    if (username == "") {
                      showErrorDialog(context, "You have to create a username");
                    } else {
                      if (signUpMethod == "user") {
                      String result =
                          await auth.signUpAsUser(username, email, password, address);
                          if (result == "0") {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                          (route) => false,
                        );
                      } else {
                        showErrorDialog(context, result);
                      }
                      } else {
                        String result =
                          await auth.signUpAsRestaurant(username, email, password, address);
                      if (result == "0") {
                        String name = await db.getName(FirebaseAuth.instance.currentUser!.uid);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResScaffold(name: name),
                          ),
                          (route) => false,
                        );
                      } else {
                        showErrorDialog(context, result);
                      }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(150, 75)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
