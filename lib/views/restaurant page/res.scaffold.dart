// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:food_order/services/auth.dart';
import 'package:food_order/views/auth/welcome.dart';
import 'package:food_order/views/restaurant%20page/notifications.dart';
import 'package:food_order/views/restaurant%20page/res_profile.dart';

class ResScaffold extends StatefulWidget {
  final String name;
  const ResScaffold({super.key, required this.name});

  @override
  State<ResScaffold> createState() => _ResScaffoldState(name);
}

class _ResScaffoldState extends State<ResScaffold> {
  final String name;
  int _selectedIndex = 0;

  _ResScaffoldState(this.name);
  void _onTapValue(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
  final List<Widget> _widgets = <Widget>[
    const ResProfile(),
    const Notifications()
  ];
  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
          return Scaffold(
            appBar: AppBar(
              title: Text(name),
            ),
            body: _widgets.elementAt(_selectedIndex),
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
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.store,
                  ),
                  label: "Restaurant",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: "Notifications",
                ),
              ],
              currentIndex: _selectedIndex,
              onTap:(value) => _onTapValue(value),
            ),
          );
        }
  }

