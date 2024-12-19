import 'package:aftahrs/menupage/component/DiscountBanner.dart';
import 'package:aftahrs/menupage/component/ProfileMenu.dart';
// import 'package:aftahrs/menupage/component/profile_images';
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
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // CircleAvatar(
                //   backgroundColor: Color.fromARGB(31, 255, 255, 255),
                //   // child: Icon(Icons.person, color: Colors.black),
                // ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Adewale Adumatta",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    
                  ],
                ),
              ],
            ),
            Row(
              children: [
                
                Icon(Icons.settings, color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // ProfilePic(),
            // Text(
            //   "Annette Black",
            // ),
            // DiscountBanner(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/user (1).svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "About Us",
              icon: "assets/icons/file-chart-line.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Payment",
              icon: "assets/icons/usd-circle.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/interrogation.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/exit.svg",
              press: () {
                // String token = 'user-authentication-token';
                logoutUser(context);
              },
            ),
            DiscountBanner(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(initialIndex: 4),
    );
  }
}
