import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        backgroundColor: Colors.redAccent,
      ),
      body: const Center(
        child: Text("Your orders will appear here."),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 1),
    );
  }
}
