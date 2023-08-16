// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order/services/database.dart';
import 'package:food_order/views/user%20page/restaurants/res_card.dart';
import '../../../models/res_model.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    Database db = Database();
    return StreamBuilder(
      stream: db.getRestaurants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (!snapshot.hasData) {
          return const Text("There are no any restaurants.");
        } else {
          final List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
          List<Restaurant> restaurants = docs.map(
            (doc) {
              return Restaurant(
                name: doc.get("name") ?? "",
                email: doc.get("email") ?? "",
                address: doc.get("address") ?? "",
                description: doc.get("description") ?? "",
                foods: doc.get("foods") ?? [],
                public: doc.get("public") ?? false,
              );
            },
          ).toList();
          final List<Restaurant> publicRestaurants = restaurants.where((res) => res.public == true).toList();
            return ListView.builder(
              itemCount: publicRestaurants.length,
              itemBuilder: (context, index) {
                final Restaurant restaurant = publicRestaurants[index];
                return RestaurantCard(
                  name: restaurant.name,
                  email: restaurant.email,
                  description: restaurant.description,
                  address: restaurant.address,
                  foods: restaurant.foods,
                );
              },
            );
        }
      },
    );
  }
}
