// lib/common/mock_data.dart
import 'package:flutter/material.dart';
import '../models/models.dart';

/// ----------------------
/// Sprint 3: Mock Reminders
/// ----------------------
final List<Reminder> kMockReminders = [
  Reminder(
    id: 'r1',
    pickupType: PickupType.recycling,
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

/// ----------------------
/// Sprint 3: Mock Recycling Centers
/// ----------------------
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

/// ----------------------
/// Sprint 4: Mock Pickup Schedules
/// ----------------------
/// Each schedule represents a weekly pickup plan for an area.
/// Used for showing “Pickup Schedule” screen before backend integration.
final List<PickupSchedule> kMockPickupSchedules = [
  PickupSchedule(
    id: 'ps1',
    area: 'Downtown San Jose',
    dayOfWeek: 'Monday',
    pickupType: 'Recycling & Trash',
    nextPickupDate: DateTime(2025, 11, 10),
    timeRange: '7:00 AM – 9:00 AM',
    notes: 'Separate recyclables from trash bins.',
  ),
  PickupSchedule(
    id: 'ps2',
    area: 'Willow Glen',
    dayOfWeek: 'Wednesday',
    pickupType: 'Recycling Only',
    nextPickupDate: DateTime(2025, 11, 12),
    timeRange: '6:30 AM – 8:30 AM',
    notes: 'Plastic bottles, paper, and aluminum cans only.',
  ),
  PickupSchedule(
    id: 'ps3',
    area: 'Evergreen District',
    dayOfWeek: 'Friday',
    pickupType: 'Yard Waste',
    nextPickupDate: DateTime(2025, 11, 14),
    timeRange: '8:00 AM – 10:00 AM',
    notes: 'Leaves and small branches must be bagged.',
  ),
];
