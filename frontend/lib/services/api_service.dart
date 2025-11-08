// Simple HTTP client for the backend API.
// Uses 10.0.2.2 so Android emulator can reach your Mac localhost:8080.
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8080';

  static Future<String> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final resp = await http.post(
      Uri.parse('$baseUrl/api/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    // Helpful while debugging:
    // print('SIGNUP ${resp.statusCode}: ${resp.body}');

    if (resp.statusCode == 201) return 'Account created';
    if (resp.statusCode == 409) throw 'Email already exists';
    if (resp.statusCode == 400) throw 'Invalid input';
    throw 'Signup failed (${resp.statusCode})';
  }

  static Future<String> login({
    required String email,
    required String password,
  }) async {
    final resp = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    // Helpful while debugging:
    // print('LOGIN ${resp.statusCode}: ${resp.body}');

    if (resp.statusCode == 200) return 'Login successful';
    if (resp.statusCode == 401) throw 'Invalid credentials';
    throw 'Login failed (${resp.statusCode})';
  }
}
