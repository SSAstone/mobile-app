import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoHome extends StatefulWidget {
  const GoHome({super.key});

  @override
  State<GoHome> createState() => _GoHomeState();
}

class _GoHomeState extends State<GoHome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}