import 'package:aftahrs/auth/component/OtpForm.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 36),
                  Image.asset(
                    'assets/images/logo-aftahrs1.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Verify your email address",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Splash',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Type the verification code we've sent you",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF757575)),
                  ),
                  // const SizedBox(height: 16),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const OtpForm(),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend verification Code",
                      style: TextStyle(color: Color(0xFF757575)),
                    ),
                  ),
                  // Spacer(
                  //   flex: 1,
                  // ),
                  SizedBox(height: 100),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      "Already have an account? Log in",
                      style: TextStyle(color: Color(0xFF757575)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
