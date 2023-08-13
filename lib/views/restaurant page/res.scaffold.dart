// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order/models/res_model.dart';
import 'package:food_order/services/database.dart';

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
          );
        });
  }
}
