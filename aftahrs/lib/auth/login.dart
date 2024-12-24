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
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/homepage');
                      },
                      child: const Text('Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          )),
                    ),
                    const SizedBox(height: 10),
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
                        padding: const EdgeInsets.all(20.0),
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
                              'Continue',
                            ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black, // Line color
                            thickness: 0.1, // Line thickness
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or signup with us',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black, // Line color
                            thickness: 0.1, // Line thickness
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '#');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        backgroundColor:
                            const Color.fromARGB(255, 224, 223, 223),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centers content in the Row
                        children: [
                          Image.asset(
                            'assets/images/GoogleLogo-canvas-404-300px.original.png',
                            width: 20,
                          ),
                          const SizedBox(
                              width:
                                  8), // Adds space between the image and text
                          const Text(
                            'Continue with Google',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          // const SizedBox(
                          //     width:
                          //         8), // Adds space between the text and icon
                          // const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '#');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        backgroundColor:
                            const Color.fromARGB(255, 224, 223, 223),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              'assets/images/png-transparent-apple-logo-logo-apple-icon-information-apple-logo-logo-monochrome-black-removebg-preview.png',
                              width: 30),
                          // SizedBox(width: 100),
                          const SizedBox(
                              width:
                                  8), // Adds space between the image and text
                          const Text(
                            'Continue with Apple',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        backgroundColor:
                            const Color.fromARGB(255, 224, 223, 223),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SvgPicture.asset(
                          //   'assets/icons ser (1).svg',
                          //   width: 20,
                          //   color: Colors.white,
                          //   height: 20,
                          // ),
                          Icon(Icons.person_outline_sharp,
                              color: const Color.fromARGB(255, 1, 0, 0)),
                          // Image.asset('assets/images/Splash bk.png', width: 10),
                          const SizedBox(
                              width:
                                  8), // Adds space between the image and text
                          const Text(
                            'Use Email Address',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
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
