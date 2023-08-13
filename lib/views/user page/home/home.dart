// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_order/services/auth.dart';
import 'package:food_order/views/auth/welcome.dart';
import 'package:food_order/views/user%20page/profile/profile.dart';
import 'package:food_order/views/user%20page/restaurants/res_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> views = [
    const RestaurantList(),
    const Profile(),
  ];
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: views.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          onItemTapped(value);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          auth.signOut();
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
  }
}
