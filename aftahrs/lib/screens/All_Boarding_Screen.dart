import 'package:aftahrs/auth/login.dart';
import 'package:aftahrs/auth/skip.dart';
import 'package:aftahrs/home/homepage_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _getStarted() {
    // Simulate "Next" behavior for the first page
    _nextPage();
  }

  void _proceed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Skipscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          _buildPage(
            title: 'Discover Delicious Deals on Excess Food',
            description:
                'AftaHours is a technology company focused on connecting excess food to consumers from their favorite restaurants in the US.',
            buttonText: 'Get Started',
            buttonAction: _getStarted, // Trigger the next page
            image: 'assets/images/onboarding.png',
          ),
          _buildPage(
            title: 'Discover Delicious Deals on Excess Food',
            description:
                'AftaHours is a technology company focused on connecting excess food to consumers from their favorite restaurants in the US.',
            buttonText: 'Next',
            buttonAction: _nextPage,
            image: 'assets/images/onboarding.png',
          ),
          _buildPage(
            title: 'Food Marketplace Innovation',
            description:
                'AftaHours is a technology company focused on connecting excess food to consumers from their favorite restaurants in the US.',
            buttonText: 'Proceed',
            buttonAction: () => _proceed(context),
            image: 'assets/images/onboarding.png',
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback buttonAction,
    required String image,
  }) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 75,
                fontFamily: 'Splash',
                height: 1.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 254, 254, 254),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'SF Pro Display',
              ),
            ),
          ),
          // SizedBox(height: 100),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => DotIndicator(isActive: index == _currentPage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                buttonAction();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                backgroundColor: const Color.fromARGB(255, 251, 252, 252),
                foregroundColor: const Color.fromARGB(255, 5, 5, 5),
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.activeColor = const Color.fromARGB(255, 250, 250, 250),
    this.inActiveColor = const Color.fromARGB(255, 224, 221, 221),
  });

  final bool isActive;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 5,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
