import 'package:aftahrs/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(initialIndex: 3),
    );
  }
}
