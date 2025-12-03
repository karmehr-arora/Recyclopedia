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
  Future<RecyclingCenter> createRecyclingCenters(RecyclingCenter r);
  Future<void> deleteRecyclingCenters(String id);
  Future<RecyclingCenter> updateRecyclingCenters(RecyclingCenter reminder);
}
