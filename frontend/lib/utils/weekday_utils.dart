// lib/utils/weekday_utils.dart
import 'package:flutter/material.dart';

/// Utility to format and compute pickup-related dates/times.
class WeekdayUtils {
  /// Converts [weekday] (1=Mon, 7=Sun) to short name.
  static String weekdayName(int weekday) {
    const names = {
      DateTime.monday: 'Mon',
      DateTime.tuesday: 'Tue',
      DateTime.wednesday: 'Wed',
      DateTime.thursday: 'Thu',
      DateTime.friday: 'Fri',
      DateTime.saturday: 'Sat',
      DateTime.sunday: 'Sun',
    };
    return names[weekday] ?? 'Day';
  }

  /// Converts numeric month to short name.
  static String monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[(month - 1) % 12];
  }

  /// Given a [dayOfWeek] and [time], returns the next occurrence after [from].
  static DateTime nextOccurrence({
    required int dayOfWeek,
    required TimeOfDay time,
    DateTime? from,
  }) {
    final now = from ?? DateTime.now();
    // Start from today’s date at the scheduled time.
    DateTime candidate = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    int delta = dayOfWeek - now.weekday;
    if (delta < 0) delta += 7;

    if (delta == 0 && candidate.isBefore(now)) {
      delta = 7; // next week
    }

    return candidate.add(Duration(days: delta));
  }

  /// Formats something like: "Thu, Nov 13 • 7:30 AM"
  static String formatNextPickup(DateTime next, BuildContext context) {
    final weekday = weekdayName(next.weekday);
    final month = monthName(next.month);
    final time = TimeOfDay(hour: next.hour, minute: next.minute).format(context);
    return "$weekday, $month ${next.day} • $time";
  }
}
