import 'package:aftahrs/widgets/CustomSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class Skipscreen extends StatefulWidget {
  const Skipscreen({super.key});

  @override
  _SkipscreenState createState() => _SkipscreenState();
}

class _SkipscreenState extends State<Skipscreen> {
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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/logo-aftahrs1.png', width: 30),
                // CircleAvatar(
                //   backgroundColor: Color.fromARGB(31, 255, 255, 255),
                //   child: Icon(Icons.person, color: Colors.black),
                // ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homepage');
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Splash',
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
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
                      'Explore great offers from Aftahours.',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Splash',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 114, 2, 2),
                      ),
                    ),
                    SizedBox(height: 10),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '#');
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
                            ),
                            // const SizedBox(
                            //     width:
                            //         8), // Adds space between the text and icon
                            // const Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '#');
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
                              color: const Color.fromARGB(255, 255, 255, 255)),
                          // Image.asset('assets/images/Splash bk.png', width: 10),
                          const SizedBox(
                              width:
                                  8), // Adds space between the image and text
                          const Text(
                            'Use Email Address',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Already have an account? Log in',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    ),
                    const SizedBox(height: 10),
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
