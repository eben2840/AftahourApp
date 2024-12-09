import 'package:flutter/material.dart';
import '../services/api_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    bool success = await ApiService.login(
      emailController.text,
      passwordController.text,
    );

    if (success) {
      Navigator.pushReplacementNamed(context, '/homepage');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Login_Signup.png',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground Content
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(40.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      255, 244, 242, 242), // Ash background color
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 23, 22, 22),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                20.0), // Top-left corner rounded
                            topRight: Radius.circular(
                                20.0), // Top-right corner rounded
                            bottomLeft:
                                Radius.zero, // Bottom-left corner square
                            bottomRight: Radius.zero,
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero, // Top-left corner rounded
                            topRight: Radius.zero, // Top-right corner rounded
                            bottomLeft: Radius.circular(
                                20.0), // Bottom-left corner square
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => loginUser(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(25.0),
                        backgroundColor: const Color.fromARGB(255, 1, 1, 1),
                        foregroundColor:
                            const Color.fromARGB(255, 253, 252, 252),
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text(
                        'Continue',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Forgot Password?',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Don\'t have an account? Register',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
