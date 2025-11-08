// lib/screens/pickup_schedule_screen.dart
import 'package:flutter/material.dart';
import '../common/mock_data.dart';
import '../models/pickup_schedule.dart';
import '../utils/weekday_utils.dart';

class PickupScheduleScreen extends StatelessWidget {
  const PickupScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Find the soonest upcoming pickup
    final soonest = kMockPickupSchedules.reduce((a, b) =>
    a.nextPickupDate.isBefore(b.nextPickupDate) ? a : b);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycling Pickup Schedule'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _NextPickupBanner(schedule: soonest),
          const SizedBox(height: 12),
          ...kMockPickupSchedules.map((schedule) {
            final formatted = WeekdayUtils.formatNextPickup(
              schedule.nextPickupDate,
              context,
            );

            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.calendar_today, color: Colors.green),
                title: Text(
                  schedule.area,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(schedule.pickupType),
                      Text(
                        "Next: $formatted",
                        style: TextStyle(color: theme.colorScheme.secondary),
                      ),
                      Text("Time: ${schedule.timeRange}"),
                      if (schedule.notes != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            schedule.notes!,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                    ],
                  ),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.green),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _NextPickupBanner extends StatelessWidget {
  final PickupSchedule schedule;
  const _NextPickupBanner({required this.schedule});

  @override
  Widget build(BuildContext context) {
    final formatted =
    WeekdayUtils.formatNextPickup(schedule.nextPickupDate, context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.recycling, color: Colors.green, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Next Pickup: ${schedule.area}\n$formatted",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
