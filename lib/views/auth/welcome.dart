// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:food_order/views/auth/sign_in.dart';
import 'package:food_order/views/auth/sign_up.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Chat App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(
                      hintText: 'Create a username',
                      labelText: 'Username',
                      signUpMethod:"user"
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 75)),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 75,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(
                      hintText: "Enter your restaurant's name",
                      labelText: "Name",
                      signUpMethod: "restaurant",
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 75)),
              child: Text(
                "Sign Up as Restaurant",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              height: 75,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 75)),
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
