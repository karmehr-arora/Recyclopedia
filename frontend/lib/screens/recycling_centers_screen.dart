import 'package:flutter/material.dart';

class RecyclingCentersScreen extends StatelessWidget {
  const RecyclingCentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Recycling Centers"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Center(
            child: Text(
              "Find and connect with your local recycling centers.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text("San Jose Recycling Center"),
              subtitle: Text("Accepts plastic, paper, metal, and glass."),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text("Green Earth Compost Facility"),
              subtitle: Text("Accepts compostable waste and yard trimmings."),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text("EcoDrop E-Waste Center"),
              subtitle: Text("Accepts electronics and batteries."),
            ),
          ),
        ],
      ),
    );
  }
}
