import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mantis_inventory/models/user_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://172.93.51.119:9090/api/v1';

  Future<Map<String, dynamic>?> signUp(
    String name,
    String description,
    String email,
    String phone,
    UserRequestModel userModel,
  ) async {
    final payload = {
      'name': name,
      'description': description,
      'email': email,
      'phone': phone,
      'userRequest': userModel.toJson(),
    };

    final url = Uri.parse('$baseUrl/organizations');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);
        print('Signup Success: $data');

        return data;
      } else {
        print('Signup Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Signup request failed: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> signIn(String username, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Login Successful:${response.body}');

        final data = jsonDecode(response.body);

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('signup_response', jsonEncode(data));
        final jsonString = prefs.getString('signup_response');
        print('Stored signup data: $jsonString');
        return jsonDecode(response.body);
      } else {
        print('Login Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Login request failed: $e');
      return null;
    }
  }
}
