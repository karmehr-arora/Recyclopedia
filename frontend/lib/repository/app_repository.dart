// lib/repository/app_repository.dart
import 'dart:async';
import 'package:flutter/material.dart' show TimeOfDay;

import '../models/models.dart';

/// Contract your app can depend on (easy to swap later for real backend)
abstract class AppRepository {
  // Reminders
  Future<List<Reminder>> fetchReminders();
  Future<Reminder> createReminder(Reminder reminder);
  Future<void> deleteReminder(String id);
  Future<Reminder> updateReminder(Reminder reminder);

  // Recycling centers
  Future<List<RecyclingCenter>> fetchRecyclingCenters({String? query});
}

class MockAppRepository implements AppRepository {
  // --- In-memory mock data -----------------------------------------------

  final List<Reminder> _reminders = <Reminder>[
    Reminder(
      id: 'r1',
      pickupType: PickupType.recycling,
      dayOfWeek: DateTime.thursday, // 1=Mon … 7=Sun (DateTime constants)
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
      notes: 'Put bin out after dinner.',
    ),
  ];

  final List<RecyclingCenter> _centers = <RecyclingCenter>[
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

  // --- API-like methods ---------------------------------------------------

  @override
  Future<List<Reminder>> fetchReminders() async =>
      Future.value(List.unmodifiable(_reminders));

  @override
  Future<Reminder> createReminder(Reminder reminder) async {
    _reminders.add(reminder);
    return Future.value(reminder);
  }

  @override
  Future<void> deleteReminder(String id) async {
    _reminders.removeWhere((r) => r.id == id);
  }

  @override
  Future<Reminder> updateReminder(Reminder reminder) async {
    final idx = _reminders.indexWhere((r) => r.id == reminder.id);
    if (idx != -1) {
      _reminders[idx] = reminder;
    }
    return Future.value(reminder);
  }

  @override
  Future<List<RecyclingCenter>> fetchRecyclingCenters({String? query}) async {
    final q = query?.toLowerCase().trim();
    final items = (q == null || q.isEmpty)
        ? _centers
        : _centers.where((c) =>
    c.name.toLowerCase().contains(q) ||
        c.accepts.any((a) => a.toLowerCase().contains(q)));
    return Future.value(List.unmodifiable(items));
  }
}
