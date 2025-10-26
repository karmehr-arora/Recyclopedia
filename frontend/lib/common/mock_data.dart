// lib/common/mock_data.dart
import 'package:flutter/material.dart';
import '../models/models.dart';

/// Mock reminders used to populate the UI before wiring to a backend.
final List<Reminder> kMockReminders = [
  Reminder(
    id: 'r1',
    pickupType: PickupType.recycling,
    // Use DateTime.thursday (int 4), not DateTime.thursday.weekday
    dayOfWeek: DateTime.thursday,
    time: const TimeOfDay(hour: 7, minute: 30),
    remindSetOut: true,
    remindBringIn: true,
    notes: 'Remember to rinse containers.',
  ),
  Reminder(
    id: 'r2',
    pickupType: PickupType.trash,
    dayOfWeek: DateTime.monday,
    time: const TimeOfDay(hour: 19, minute: 0),
    remindSetOut: true,
    remindBringIn: false,
  ),
];

/// Mock recycling centers for Sprint 3 task 2.
final List<RecyclingCenter> kMockCenters = [
  const RecyclingCenter(
    id: 'c1',
    name: 'City Recycling Center',
    address: '123 Green St',
    phone: '(555) 123-4567',
    website: 'https://example.com/center',
    accepts: ['Paper', 'Cardboard', 'PET (#1)', 'HDPE (#2)'],
    hours: 'Mon–Sat 9:00–17:00',
    notes: 'Closed on holidays.',
  ),
  const RecyclingCenter(
    id: 'c2',
    name: 'County Drop-off',
    address: '45 Blue Ave',
    accepts: ['Glass', 'Metal', 'Mixed Paper'],
    hours: 'Sat 8:00–12:00',
  ),
];
