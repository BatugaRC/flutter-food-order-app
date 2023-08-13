// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:food_order/utils/show_error_dialog.dart';
import 'package:food_order/views/user%20page/home/home.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';

class ResSignUp extends StatefulWidget {
  const ResSignUp({Key? key}) : super(key: key);

  @override
  State<ResSignUp> createState() => _ResSignUpState();
}

class _ResSignUpState extends State<ResSignUp> {
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _address;

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
                    hintText: "Enter your restaurant's name",
                    labelText: "Name",
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
                      String result =
                          await auth.signUpAsRestaurant(username, email, password, address);
                      if (result == "0") {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                          (route) => false,
                        );
                      } else {
                        showErrorDialog(context, result);
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
