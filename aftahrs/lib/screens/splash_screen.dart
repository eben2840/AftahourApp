import 'package:aftahrs/auth/login.dart';
import 'package:aftahrs/auth/skip.dart';
import 'package:aftahrs/home/homepage_screen.dart';
import 'package:aftahrs/screens/All_Boarding_Screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required String title});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isFirstTime;

  @override
  void initState() {
    super.initState();
    checkFirstTimeUser();
  }

  void checkFirstTimeUser() async {
    await Future.delayed(
        Duration(seconds: 2)); // Adjusted delay for smoother experience

    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? isFirstTime = prefs.getBool('isFirstTime');
    bool? isLoggedIn = prefs.getBool('isLoggedIn') ??
        false; // Assuming 'isLoggedIn' key is stored after user logs in

    if (isFirstTime == null || isFirstTime) {
      // First-time user
      prefs.setBool(
          'isFirstTime', false); // Set the flag to false after first launch
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) =>
                OnboardingScreen()), // Navigate to onboarding screen
      );
    } else {
      if (isLoggedIn) {
        // User is logged in, navigate to the HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  const HomepageScreen()), // Assuming you have a HomePage
        );
      } else {
        // User is not logged in, navigate to LoginScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => Skipscreen()), // Navigate to login screen
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Splash bk.png', // Replace with your background image path
              fit: BoxFit
                  .cover, // This will cover the entire screen with the background image
            ),
          ),
          // Centered Splash Image
          Center(
            child: Image.asset(
              'assets/images/Signup logo.png', // Replace with your splash image path
              width: 150, // Adjust the size as needed
              height: 150, // Adjust the size as needed
              fit: BoxFit.contain, // Adjust the image's fit
            ),
          ),
        ],
      ),
    );
  }
}
