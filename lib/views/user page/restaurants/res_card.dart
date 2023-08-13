import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final String description;
  final List<dynamic> foods;
  const RestaurantCard({super.key, required this.name, required this.email, required this.address, required this.foods, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}