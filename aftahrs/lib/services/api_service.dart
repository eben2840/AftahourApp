import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://backend.aftahrs.com';

  /// Login API
  static Future<bool> login(String email, String password) async {
    if (email == 'johndoe@me.com' && password == 'password') {
      return true; // Simulated successful login
    }
    return false; // Simulated failure
  }

    // try {
    //   final response = await http.post(
    //     Uri.parse('$baseUrl/login'),
    //     body: json.encode({'email': email, 'password': password}),
    //     headers: {'Content-Type': 'application/json'},
    //   );

    //    if (response.statusCode == 200) {
    //     final responseData = json.decode(response.body);
    //     print('Login successful: $responseData');
    //     return true;
    //   } else {
    //     print('Login failed: ${response.statusCode} - ${response.body}');
    //     return false;
    //   }
    // } catch (e) {
    //   print('Error during login: $e');
    //   return false;
    // }
    // }

  /// Signup API
  static Future<bool> signup(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        body: json.encode({'name': name, 'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        print('Signup successful: $responseData');
        return true;
      } else {
        print('Signup failed: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during signup: $e');
      return false;
    }
  }

  /// Reset Password API
  static Future<bool> resetPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/reset-password'),
        body: json.encode({'email': email}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Reset password email sent: $responseData');
        return true;
      } else {
        print(
            'Reset password failed: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during password reset: $e');
      return false;
    }
  }
}
