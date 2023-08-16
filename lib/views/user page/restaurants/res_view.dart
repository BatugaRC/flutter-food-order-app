// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

class ResView extends StatefulWidget {
  final String name;
  final String? email;
  final String? address;
  final String? description;
  final List<dynamic>? foods;
  const ResView(
      {super.key,
      required this.name,
      required this.email,
      required this.address,
      required this.description,
      required this.foods});

  @override
  State<ResView> createState() =>
      _ResViewState(name, email, address, description, foods);
}

class _ResViewState extends State<ResView> {
  final String name;
  final String? email;
  final String? address;
  final String? description;
  final List<dynamic>? foods;

  _ResViewState(
      this.name, this.email, this.address, this.description, this.foods);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
        ),
      ),
    );
  }
}
