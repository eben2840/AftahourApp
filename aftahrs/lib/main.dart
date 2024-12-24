import 'package:aftahrs/ProductDetailsScreen/ProductDetailsScreen.dart';
import 'package:aftahrs/ProductDetailsScreen/newone.dart';
import 'package:aftahrs/auth/login.dart';
import 'package:aftahrs/auth/opt.dart';
import 'package:aftahrs/auth/signup.dart';
import 'package:aftahrs/auth/skip.dart';
import 'package:aftahrs/home/homepage_screen.dart';
import 'package:aftahrs/menupage/menu_page.dart';
import 'package:aftahrs/orderpage/order_page.dart';
import 'package:aftahrs/screens/All_Boarding_Screen.dart';
// import 'package:aftahrs/screens/onboarding_screen.dart';
import 'package:aftahrs/screens/splash_screen.dart';
import 'package:aftahrs/searchpage/search_page.dart';
import 'package:aftahrs/shop/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Make the status bar transparent and set the app's theme
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar to transparent
      statusBarIconBrightness:
          Brightness.dark, // Set status bar icons color to dark
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Aftahrs App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(
              title: 'Splash Screen',
            ),
        '/onboarding': (context) => OnboardingScreen(),
        '/otp': (context) => OtpScreen(),
        '/productdetails': (context) => ProductDetailsScreen(),
        '/newone': (context) => Newone(),
        '/login': (context) => LoginScreen(),
        '/homepage': (context) => const HomepageScreen(),
        '/orders': (context) => const OrderPage(),
        '/search': (context) => SearchPage(),
        '/menu': (context) => const MenuPage(),
        '/shop': (context) => const Shop(),
        '/signup': (context) => Signup_RegsiterState(),
        '/skip': (context) => Skipscreen(),
      },
    );
  }
}
