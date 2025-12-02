import 'dart:convert';
import 'package:http/http.dart' as http;

import 'app_repository.dart';
import '../models/models.dart';

class ApiAppRepository implements AppRepository {
  static const String baseUrl = "http://localhost:8080/api";

  @override
  Future<List<Reminder>> fetchReminders() async {
    final res = await http.get(Uri.parse("$baseUrl/reminders"));

    if (res.statusCode != 200) throw Exception("Failed to load reminders");

    final List<dynamic> data = jsonDecode(res.body);
    return data.map((json) => Reminder.fromJson(json)).toList();
  }

  @override
  Future<Reminder> createReminder(Reminder r) async {
    final res = await http.post(
      Uri.parse("$baseUrl/reminders"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(r.toJson()),
    );

    if (res.statusCode != 200 && res.statusCode != 201) throw Exception("Failed to create reminder");

    return Reminder.fromJson(jsonDecode(res.body));
  }

  @override
  Future<Reminder> updateReminder(Reminder r) async {
    final res = await http.put(
      Uri.parse("$baseUrl/reminders/${r.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(r.toJson()),
    );

    if (res.statusCode != 200) throw Exception("Failed to update reminder");

    return Reminder.fromJson(jsonDecode(res.body));
  }

  @override
  Future<void> deleteReminder(String id) async {
    final res = await http.delete(Uri.parse("$baseUrl/reminders/$id"));
    if (res.statusCode != 200) throw Exception("Delete failed");
  }

  @override
  Future<List<RecyclingCenter>> fetchRecyclingCenters({String? query}) async {
    final res = await http.get(Uri.parse("$baseUrl/centers"));

    if (res.statusCode != 200) throw Exception("Failed to load reminders");

    final List<dynamic> data = jsonDecode(res.body);
    return data.map((json) => RecyclingCenter.fromJson(json)).toList();
  }

  @override
  Future<RecyclingCenter> createRecyclingCenters(RecyclingCenter center) async {
    final res = await http.post(
      Uri.parse("$baseUrl/centers"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(center.toJson()),
    );

    if (res.statusCode != 200 && res.statusCode != 201) throw Exception("Failed to create reminder");

    return RecyclingCenter.fromJson(jsonDecode(res.body));
  }

  @override
  Future<void> deleteRecyclingCenters(String id) async {
    final res = await http.delete(Uri.parse("$baseUrl/centers/$id"));
    if (res.statusCode != 200) throw Exception("Delete failed");
  }

  @override
  Future<RecyclingCenter> updateRecyclingCenters(RecyclingCenter r) async {
    final res = await http.put(
      Uri.parse("$baseUrl/centers/${r.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(r.toJson()),
    );

    if (res.statusCode != 200) throw Exception("Failed to update reminder");

    return RecyclingCenter.fromJson(jsonDecode(res.body));
  }
}