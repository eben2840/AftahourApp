import 'package:aftahrs/widgets/CustomSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class Signup_RegsiterState extends StatefulWidget {
  const Signup_RegsiterState({super.key});

  @override
  _Signup_RegsiterStateState createState() => _Signup_RegsiterStateState();
}

class _Signup_RegsiterStateState extends State<Signup_RegsiterState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Signup_RegsiterState({super.key});
  bool isLoading = false;

  void signUser(BuildContext context) async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        locationController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Call the API
    bool success = await ApiService.signup(
      nameController.text,
      emailController.text,
      locationController.text,
      phoneController.text,
      passwordController.text,
      confirmPasswordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (success) {
      // String token = await ApiService.getAuthToken();

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('authToken', token);

      CustomSnackBar.showSuccessSnackBar(
        context,
        'SignUp successful! Login to Continue.',
      );
      Navigator.pushReplacementNamed(context, '/login');
      print('Signup successful==============:');
    } else {
      print('Signup Unsuccessful==============:');
      CustomSnackBar.showErrorSnackBar(
        context,
        'SignUp failed. Please try again.',
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
                      'SignUp',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Splash',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 114, 2, 2),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
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
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        hintText: 'location',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
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
                          borderRadius: BorderRadius.all(
                            Radius.zero,
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 2),
                    TextField(
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
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
                              signUser(context);
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
                              'Signup',
                            ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'I have an account? Login',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
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
