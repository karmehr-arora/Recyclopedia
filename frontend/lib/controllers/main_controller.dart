import 'package:flutter/material.dart';
import '../screens/dashboard.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';

class MainController extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final _pages = const [
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
}
