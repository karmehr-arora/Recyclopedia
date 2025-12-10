// lib/controllers/main_controller.dart
import 'package:flutter/material.dart';
import '../screens/dashboard.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';

import '../models/models.dart';
import '../repository/app_repository.dart';

class MainController extends ChangeNotifier {
  // Bottom navigation state
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _pages = const [
    Dashboard(),
    LoginScreen(),
    SignUpScreen(),
  ];

  Widget get currentPage => _pages[_currentIndex];

  void setIndex(int i) {
    if (i == _currentIndex) return;
    if (i < 0 || i >= _pages.length) return; // index guard
    _currentIndex = i;
    notifyListeners();
  }

  void returnToDashboard() => setIndex(0);
  void goToLogin() => setIndex(1);
  void showSignUp() => setIndex(2);

  // Repository and initial load
  final AppRepository repo;
  MainController({AppRepository? repository})
      : repo = repository ?? ApiAppRepository() {
    _init();
  }

  bool _loading = true;
  bool get loading => _loading;

  List<Reminder> _reminders = [];
  List<RecyclingCenter> _centers = [];

  List<Reminder> get reminders => List.unmodifiable(_reminders);
  List<RecyclingCenter> get centers => List.unmodifiable(_centers);

  Future<void> _init() async {
    _reminders = await repo.fetchReminders();
    _centers = await repo.fetchRecyclingCenters();
    _loading = false;
    notifyListeners();
  }

  // Reminders actions
  Future<void> toggleReminder(String id) async {
    final i = _reminders.indexWhere((r) => r.id == id);
    if (i == -1) return;
    final updated = _reminders[i].copyWith(enabled: !_reminders[i].enabled);
    _reminders[i] = updated;
    await repo.updateReminder(updated);
    notifyListeners();
  }

  Future<void> addReminder(Reminder r) async {
    final created = await repo.createReminder(r);
    _reminders.add(created);
    notifyListeners();
  }

  Future<void> deleteReminder(String id) async {
    await repo.deleteReminder(id);
    _reminders.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  // Recycling centers actions
  Future<void> searchCenters(String? query) async {
    _centers = await repo.fetchRecyclingCenters(query: query);
    notifyListeners();
  }
}
