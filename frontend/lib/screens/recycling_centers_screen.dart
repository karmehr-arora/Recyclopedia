import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/main_controller.dart';
import '../models/models.dart';

class RecyclingCentersScreen extends StatelessWidget {
  const RecyclingCentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);
    final centers = controller.centers;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Recycling Centers"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: controller.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Text(
              "Find and connect with your local recycling centers.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          // ---- SHOW REAL BACKEND CENTERS ----
          for (final c in centers)
            Card(
              child: ListTile(
                leading:
                const Icon(Icons.location_on, color: Colors.green),
                title: Text(c.name),
                subtitle: Text(
                  [
                    if (c.address != null) c.address!,
                    if (c.accepts != null)
                      "Accepts: ${c.accepts!}",
                  ].join("\n"),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
