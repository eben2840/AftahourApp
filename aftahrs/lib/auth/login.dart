import 'package:aftahrs/widgets/CustomSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> loginUser(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      
      CustomSnackBar.showErrorSnackBar(
        context,
        'Please fill in all fields',
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    bool success = await ApiService.login(
      emailController.text,
      passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (success) {
      //save user login token
      String token = await ApiService.getAuthToken();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('authToken', token);

      CustomSnackBar.showSuccessSnackBar(
        context,
        'Login successful! Welcome back.',
      );
      Navigator.pushReplacementNamed(context, '/homepage');
    } else {
      CustomSnackBar.showErrorSnackBar(
        context,
        'Login failed. Please try again.',
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
                        fontSize: 30.0,
                        fontFamily: 'Splash',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 114, 2, 2),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'aftahours@gmail.com',
                        filled: true,
                        hintStyle: TextStyle(
                          fontFamily: 'Title',
                          fontSize: 16.0,
                        ),
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                10.0), // Top-left corner rounded
                            topRight: Radius.circular(
                                10.0), // Top-right corner rounded
                            bottomLeft:
                                Radius.zero, // Bottom-left corner square
                            bottomRight: Radius.zero,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: '************',
                        filled: true,
                        hintStyle: TextStyle(
                          fontFamily: 'Title',
                          fontSize: 16.0,
                        ),
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero, // Top-left corner rounded
                            topRight: Radius.zero, // Top-right corner rounded
                            bottomLeft: Radius.circular(
                                10.0), // Bottom-left corner square
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isLoading
                          ? null // Disable button while loading
                          : () async {
                              setState(() {
                                isLoading = true; // Show loading indicator
                              });

                              await loginUser(context);
                              setState(() {
                                isLoading = false; // Hide loading indicator
                              });
                            },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        backgroundColor: const Color.fromARGB(255, 1, 1, 1),
                        foregroundColor:
                            const Color.fromARGB(255, 253, 252, 252),
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Login',
                            ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/homepage');
                      },
                      child: const Text('Forgot Password?',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
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
