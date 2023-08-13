// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, no_logic_in_create_state

import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../../utils/show_error_dialog.dart';

class SignIn extends StatefulWidget {
  final Widget widgetToBeNavigated;
  const SignIn({super.key, required this.widgetToBeNavigated});

  @override
  State<SignIn> createState() => _SignInState(widgetToBeNavigated);
}

class _SignInState extends State<SignIn> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  final Widget widgetToBeNavigated;

  _SignInState(this.widgetToBeNavigated);

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
                  height: 50,
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
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String email = _email.text;
                    String password = _password.text;
                    String result = await auth.signIn(email, password);
                    if (result == "0") {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder:(context) => widgetToBeNavigated,
                          ),
                          (route) => false);
                    } else {
                      showErrorDialog(context, result);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 75),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
