import 'package:flutter/material.dart';
import 'recycling_centers_screen.dart';
import 'reminders_screen.dart'; // Added import for your new screen

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            tooltip: 'View Local Recycling Centers',
            icon: const Icon(Icons.location_city_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const RecyclingCentersScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Recyclopedia!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Track your recycling activity, view local programs, and learn how to reduce waste effectively.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image(
                image: AssetImage('assets/images/recycle.png'),
                height: 180,
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Find Centers Button
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.location_city, color: Colors.white),
                label: const Text(
                  'Find Nearby Recycling Centers',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RecyclingCentersScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Set Reminders Button
            Center(
              child: TextButton.icon(
                icon: const Icon(Icons.notifications_active, color: Colors.green),
                label: const Text(
                  'Set Reminders',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RemindersScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
