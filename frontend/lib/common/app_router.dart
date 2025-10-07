import 'package:flutter/material.dart';
import '../views/dashboard.dart';
import '../views/signup.dart';
import '../views/login.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/dashboard': (context) => const Dashboard()
  //'/signup': (context) => const SignUpPage(),
  //'/login': (context) => const LogInPage(),
};