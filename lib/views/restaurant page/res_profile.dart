import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order/services/database.dart';

import '../../models/res_model.dart';

class ResProfile extends StatefulWidget {
  const ResProfile({super.key});

  @override
  State<ResProfile> createState() => _ResProfileState();
}

class _ResProfileState extends State<ResProfile> {
  @override
  Widget build(BuildContext context) {
    Database db = Database();
    return StreamBuilder(
      stream: db.getRestaurantData(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final data = snapshot.data;
        final Restaurant restaurant = Restaurant(
          public: data?["public"],
          description: data?["description"],
          name: data?["name"],
          email: data?["email"],
          address: data?["address"],
          foods: data?["foods"],
        );
        return Text(restaurant.address!);
      },
      
    );
  }
}
