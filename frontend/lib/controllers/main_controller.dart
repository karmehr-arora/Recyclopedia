import 'package:flutter/material.dart';
import '../views/dashboard.dart';
import '../views/login.dart';
import '../views/signup.dart';

class MainController extends ChangeNotifier {
  Widget _currentPage = Dashboard();

  Widget get currentPage => _currentPage;

  void returnToDashboard() {
    _currentPage = Dashboard();
    notifyListeners();
  }

  void showSignUp() {
    //_currentPage = SignupScreen();
    //notifyListeners();
  }

  void goToLogin() {
    //_currentPage = Login();
    //notifyListeners();
  }
}