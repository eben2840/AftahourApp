import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Search"),
      //   backgroundColor: Colors.blueAccent,
      // ),
      body: const Center(
        child: Text("Search for restaurants or stores."),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 2),
    );
  }
}
