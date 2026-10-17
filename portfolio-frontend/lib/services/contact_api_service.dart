import 'dart:convert';
import 'package:http/http.dart' as http;

class ContactApiService {
  static const String baseUrl = 'http://localhost:8080/api/ContactSave';

  static Future<bool> sendMessage({
    required String name,
    required String email,
    required String message,
    required String subject,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'message': message,
          'subject':subject,
        }),
      );

      return response.statusCode >= 200 && response.statusCode < 300;
    } catch (e) {
      print('Contact API Error: $e');
      return false;
    }
  }
}