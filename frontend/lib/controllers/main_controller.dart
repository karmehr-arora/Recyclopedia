// lib/controllers/main_controller.dart
import 'package:flutter/material.dart';

import '../screens/dashboard.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/scan_screen.dart';
import '../screens/reminders_screen.dart';
import '../screens/recycling_centers_screen.dart';
import '../screens/pickup_schedule_screen.dart';

import '../models/models.dart';
import '../repository/app_repository.dart';
import '../repository/api_app_repository.dart';
import '../common/mock_data.dart'; // mock reminders/centers/schedules

class MainController extends ChangeNotifier {
  // ---------------------------
  // Page switching (bottom nav)
  // ---------------------------
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _pages = const [
    Dashboard(),
    LoginScreen(),
    SignUpScreen(),
    ScanScreen(),
    RecyclingCentersScreen(),
    RemindersScreen(),
    PickupScheduleScreen()
  ];

  Widget get currentPage => _pages[_currentIndex];

  void setIndex(int i) {
    if (i == _currentIndex) return;
    _currentIndex = i;
    notifyListeners();
  }

  void returnToDashboard() => setIndex(0);
  void goToLogin() => setIndex(1);
  void showSignUp() => setIndex(2);

  // ---------------------------
  // Data via repository + mocks
  // ---------------------------
  final AppRepository repo;
  MainController({AppRepository? repository})
      : repo = repository ?? ApiAppRepository() {
    _init();
  }

  bool _loading = true;
  bool get loading => _loading;

  List<Reminder> _reminders = [];
  List<RecyclingCenter> _centers = [];
  List<PickupSchedule> _schedules = []; // Sprint 4
  List<ProductInfo> _productInfo = [];

  List<Reminder> get reminders => List.unmodifiable(_reminders);
  List<RecyclingCenter> get centers => List.unmodifiable(_centers);
  List<PickupSchedule> get schedules => List.unmodifiable(_schedules);

  List<ProductInfo> get productInfo => List.unmodifiable(_products);

  Future<void> _init() async {
    // Load existing data from repo
    _reminders = List.from(await repo.fetchReminders());
    _centers = List.from(await repo.fetchRecyclingCenters());

    // Inject Sprint 4 pickup schedules from mock data
    _schedules = List<PickupSchedule>.of(kMockPickupSchedules);

    _loading = false;
    notifyListeners();
  }

  // -------- Reminders actions --------
  Future<void> toggleReminder(int? id) async {
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

  Future<void> updateReminder(Reminder r) async {
    final updated = await repo.updateReminder(r);
    final idx = _reminders.indexWhere((r) => r.id == updated.id);
    if (idx != -1) _reminders[idx] = updated;
    notifyListeners();
  }

  Future<void> deleteReminder(String id) async {
    await repo.deleteReminder(id);
    _reminders.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  // ------ Recycling centers actions ------
  Future<void> searchCenters(String? query) async {
    _centers = await repo.fetchRecyclingCenters(query: query);
    notifyListeners();
  }

  // ------ Pickup Schedule (Sprint 4) ------
  void setSchedules(List<PickupSchedule> list) {
    _schedules
      ..clear()
      ..addAll(list);
    notifyListeners();
  }

  Future<void> checkProductByBarcode(String trim)async {
    //TODO: method required for scan_screen.dart
  }
}
