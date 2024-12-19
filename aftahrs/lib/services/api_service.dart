import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'https://backend.aftahrs.com';

  /// Login API
  static Future<bool> login(String email, String password) async {
    //   if (email == 'johndoe@me.com' && password == 'password') {
    //     return true; // Simulated successful login
    //   }
    //   return false;
    // }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login/user'),
        body: json.encode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Login successful: $responseData');

        String token = responseData['data']['token'];
        print('token: $token');

        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString('authToken', token);
        // print(token);
        // Assuming the token is returned in this field
        return token.isNotEmpty;
        // return true;
        // if (responseData['success']) {
        //   return responseData['user']; // Returning user details
        // }
      } else {
        print('Login failed: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }

  static Future<String> getAuthToken() async {
    // Get token stored in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken') ?? '';
  }

  /// Signup API
  static Future<bool> signup(String name, String email, String phone,
      String location, String password, String confirmPassword) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        body: json.encode({
          'name': name,
          'email': email,
          'phone': phone,
          'location': location,
          'password': password,
          'confirm_password': confirmPassword,
        }),
        headers: {'Content-Type': 'application/json'},
      );
    

      if (response.statusCode == 201 || response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Signup successful==============: $responseData');
        return true;
      } else {
        print(
            'Signup failed-==============: ${response.statusCode} - ${response.body}');
        return false;
        // flutter run -d chrome --web-browser-flag "--disable-web-security"
      }
    } catch (e) {
      print('Error during signup: $e');
      return false;
    }
  }

  //logout route
  // static Future<void> logout(BuildContext context, String token) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse("$baseUrl/logout"),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       // Successfully logged out, clear session data
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.remove('authToken'); // Clear the token
  //       prefs.remove('isLoggedIn'); // Remove the session key

  //       // Show feedback and navigate to login screen
  //       Navigator.pushReplacementNamed(context, '/login');
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text('Logged out successfully')));
  //       print('Logout successful');
  //     } else {
  //       // Handle API error response
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Failed to logout: ${response.body}')));
  //       print('Failed to logout: ${response.body}');
  //     }
  //   } catch (e) {
  //     // Catch network or unexpected errors
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Error during logout: $e')));
  //     print('Error during logout: $e');
  //   }
  // }

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

  //subsequest API CALLS(),
  Future<void> someApiCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    if (token != null && token.isNotEmpty) {
      // Use the token in API calls
      final response = await http.get(
        Uri.parse('$baseUrl/protected-resource'),
        headers: {
          'Authorization': 'Bearer $token', // Add token to the headers
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Handle successful response
      } else {
        // Handle failure (e.g., token expired)
        print('Failed to fetch resource: ${response.statusCode}');
      }
    } else {
      print('User is not logged in.');
    }
  }

  //logout api
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken'); // Remove the token

    // Navigate to the login screen
    Navigator.pushReplacementNamed(context, '/login');
  }
}
