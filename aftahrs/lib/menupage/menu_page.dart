import 'package:aftahrs/menupage/component/ProfileMenu.dart';
import 'package:aftahrs/services/api_service.dart';
import 'package:aftahrs/widgets/CustomSnackBar.dart';
import 'package:aftahrs/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

void logoutUser(BuildContext context) async {
  // Clear session data
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('isLoggedIn'); // Remove the session key
  prefs.remove('authToken'); // Remove the authToken key

  // Navigate back to login screen
  print("user has been logouted successfully");
  Navigator.pushReplacementNamed(context, '/login');
  CustomSnackBar.showErrorSnackBar(
        context,
        'You have been logged out',
      );
  print("user has been logouted successfully");
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                // String token = 'user-authentication-token';
                logoutUser(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 3),
    );
  }
}
