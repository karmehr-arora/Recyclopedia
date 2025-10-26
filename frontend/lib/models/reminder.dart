// lib/models/reminder.dart
import 'package:flutter/material.dart';
import 'pickup_type.dart';

/// A weekly reminder for a pickup day.
class Reminder {
  final String id;
  final PickupType pickupType;

  /// 1=Monday … 7=Sunday (same as DateTime.monday … DateTime.sunday)
  final int dayOfWeek;

  /// Local time to remind
  final TimeOfDay time;

  /// Optional toggles
  final bool remindSetOut;
  final bool remindBringIn;

  /// Whether this reminder is active
  final bool enabled;

  /// Optional notes shown in UI
  final String? notes;

  const Reminder({
    required this.id,
    required this.pickupType,
    required this.dayOfWeek,
    required this.time,
    this.remindSetOut = true,
    this.remindBringIn = false,
    this.enabled = true,
    this.notes,
  });

  Reminder copyWith({
    String? id,
    PickupType? pickupType,
    int? dayOfWeek,
    TimeOfDay? time,
    bool? remindSetOut,
    bool? remindBringIn,
    bool? enabled,
    String? notes,
  }) {
    return Reminder(
      id: id ?? this.id,
      pickupType: pickupType ?? this.pickupType,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      time: time ?? this.time,
      remindSetOut: remindSetOut ?? this.remindSetOut,
      remindBringIn: remindBringIn ?? this.remindBringIn,
      enabled: enabled ?? this.enabled,
      notes: notes ?? this.notes,
    );
  }
}
