// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order/models/res_model.dart';
import 'package:food_order/services/auth.dart';
import 'package:food_order/services/database.dart';
import 'package:food_order/views/auth/welcome.dart';

class ResScaffold extends StatefulWidget {
  const ResScaffold({super.key});

  @override
  State<ResScaffold> createState() => _ResScaffoldState();
}

class _ResScaffoldState extends State<ResScaffold> {
  @override
  Widget build(BuildContext context) {
    String id = FirebaseAuth.instance.currentUser!.uid;
    Database db = Database();
    Auth auth = Auth();
    return StreamBuilder<DocumentSnapshot>(
        stream: db.getRestaurantData(id),
        builder: (context, snapshot) {
          final data = snapshot.data;
          final Restaurant restaurant = Restaurant(
            public: data?["public"],
            description: data?["description"],
            name: data?["name"],
            email: data?["email"],
            address: data?["address"],
            foods: data?["foods"],
          );
          return Scaffold(
            appBar: AppBar(
              title: Text(restaurant.name),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await auth.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Welcome(),
                  ),
                  (route) => false,
                );
              },
              child: Icon(Icons.logout),
            ),
          );
        });
  }
}
