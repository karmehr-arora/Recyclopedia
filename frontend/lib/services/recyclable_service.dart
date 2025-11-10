import 'dart:convert';
import 'package:http/http.dart' as http;

class RecyclableService {
  // If testing in an Android emulator, use 10.0.2.2 to reach your computer
  // If testing in iOS simulator, use 127.0.0.1
  // If testing on a real phone, replace with your computer's local IP
  static const String _baseUrl = "http://10.0.2.2:8080/api";

  static Future<Map<String, dynamic>> checkRecyclable(String barcode) async {
    final url = Uri.parse("$_baseUrl/checkRecyclable");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"barcode": barcode}),
    );

    if (response.statusCode == 200 || response.statusCode == 404) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to check recyclability: ${response.statusCode}");
    }
  }
}
