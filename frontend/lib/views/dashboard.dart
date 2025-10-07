import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Welcome to Recyclopedia Dashboard!',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}