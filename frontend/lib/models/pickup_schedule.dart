// lib/models/pickup_schedule.dart
import 'package:flutter/material.dart';

/// Represents a single pickup schedule entry for a specific area.
/// Example:
///   "Downtown San Jose - Monday - Recycling & Trash - 7:00 AM–9:00 AM"
class PickupSchedule {
  final String id;                // Unique ID
  final String area;              // Neighborhood or region name
  final String dayOfWeek;         // e.g., "Monday"
  final String pickupType;        // e.g., "Recycling & Trash"
  final DateTime nextPickupDate;  // Next pickup date
  final String timeRange;         // e.g., "7:00 AM – 9:00 AM"
  final String? notes;            // Optional notes or reminders

  const PickupSchedule({
    required this.id,
    required this.area,
    required this.dayOfWeek,
    required this.pickupType,
    required this.nextPickupDate,
    required this.timeRange,
    this.notes,
  });

  /// Helper: formatted version of the date like “Nov 10, 2025”
  String get formattedDate {
    return "${_monthName(nextPickupDate.month)} ${nextPickupDate.day}, ${nextPickupDate.year}";
  }

  /// Helper: short month names for display
  String _monthName(int month) {
    const months = [
      "", // padding to make index 1-based
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month];
  }

  /// A quick summary string (for list tiles, etc.)
  String get summary => "$dayOfWeek • $pickupType • $timeRange";
}
