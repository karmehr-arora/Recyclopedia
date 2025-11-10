// lib/controllers/main_controller.dart
import 'package:flutter/material.dart';

import '../screens/dashboard.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';

import '../models/models.dart';
import '../repository/app_repository.dart';
import '../services/recyclable_service.dart';

class MainController extends ChangeNotifier {
  // ---------------------------
  // Bottom navigation / pages
  // ---------------------------
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
    _currentIndex = i;
    notifyListeners();
  }

  void returnToDashboard() => setIndex(0);
  void goToLogin() => setIndex(1);
  void showSignUp() => setIndex(2);

  // ---------------------------
  // Data via repository
  // ---------------------------
  final AppRepository repo;
  MainController({AppRepository? repository})
      : repo = repository ?? MockAppRepository() {
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

  // -------- Reminders actions --------
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

  // ------ Recycling centers actions ------
  Future<void> searchCenters(String? query) async {
    _centers = await repo.fetchRecyclingCenters(query: query);
    notifyListeners();
  }

  // ---------------------------
  // Recyclability check (API)
  // ---------------------------
  Map<String, dynamic>? _productInfo;
  String? _checkError;
  bool _checking = false;

  Map<String, dynamic>? get productInfo => _productInfo;
  String? get checkError => _checkError;
  bool get checking => _checking;

  /// Calls backend /api/checkRecyclable with the provided barcode.
  Future<void> checkProductByBarcode(String barcode) async {
    final code = barcode.trim();
    if (code.isEmpty) return;

    _checking = true;
    _checkError = null;
    _productInfo = null;
    notifyListeners();

    try {
      final data = await RecyclableService.checkRecyclable(code);
      _productInfo = data;
    } catch (e) {
      _checkError = e.toString();
    } finally {
      _checking = false;
      notifyListeners();
    }
  }

  /// Clears last recyclability result.
  void clearProductInfo() {
    _productInfo = null;
    _checkError = null;
    notifyListeners();
  }
}
