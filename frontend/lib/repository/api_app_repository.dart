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

    if (res.statusCode != 201) throw Exception("Failed to create reminder");

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

  //centers TBD
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