import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/main_controller.dart';
import '../models/models.dart';

/// Local helper to turn an ISO weekday int (1–7) into a short label.
String _weekdayName(int day) {
  const names = [
    '',        // 0 (unused)
    'Mon',     // 1
    'Tue',     // 2
    'Wed',     // 3
    'Thu',     // 4
    'Fri',     // 5
    'Sat',     // 6
    'Sun',     // 7
  ];
  return (day >= 1 && day <= 7) ? names[day] : 'Day $day';
}

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);
    final reminders = controller.reminders;

    return Scaffold(
      appBar: AppBar(title: const Text("Reminders")),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, i) {
          final r = reminders[i];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(
                "${r.pickupType.name.toUpperCase()} • ${_weekdayName(r.dayOfWeek)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Time: ${r.time.format(context)}"
                    "${(r.notes != null && r.notes!.isNotEmpty) ? "\n${r.notes!}" : ""}",
              ),
              trailing: Switch(
                value: r.enabled,
                onChanged: (_) => controller.toggleReminder(r.id),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newReminder = Reminder(
            id: null, //let backend autoincrement it
            pickupType: PickupType.recycling,
            dayOfWeek: DateTime.friday, // <-- no .weekday (it's already an int)
            time: const TimeOfDay(hour: 7, minute: 30),
            remindSetOut: true,
            remindBringIn: true,
            notes: "New reminder added.",
          );
          controller.addReminder(newReminder);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
