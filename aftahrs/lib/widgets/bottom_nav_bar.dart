import 'package:aftahrs/home/homepage_screen.dart';
import 'package:aftahrs/menupage/menu_page.dart';
import 'package:aftahrs/orderpage/order_page.dart';
import 'package:aftahrs/searchpage/search_page.dart';
import 'package:aftahrs/shop/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex;

  const CustomBottomNavigationBar({super.key, required this.initialIndex});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int selectedIndex; // Internal state for managing the selected index

  // List of pages
  final List<Widget> pages = [
    HomepageScreen(), // index 0
    Shop(), // index 1
    SearchPage(), // index 2
    OrderPage(), // index 3
    MenuPage(), // index 4
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex; // Set the initial index
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex, // Use internal state
          onTap: _onItemTapped, // Call the method to update the state
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          selectedItemColor: const Color.fromARGB(255, 136, 12, 12),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 136, 12, 12),
            fontSize: 10,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: SvgPicture.asset(
                  'assets/icons/home (1).svg',
                  color: selectedIndex == 0
                      ? const Color.fromARGB(255, 136, 12, 12)
                      : Colors.grey,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: SvgPicture.asset(
                  'assets/icons/shop (2).svg',
                  color: selectedIndex == 1
                      ? const Color.fromARGB(255, 136, 12, 12)
                      : Colors.grey,
                ),
              ),
              label: 'Shops',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: SvgPicture.asset(
                  'assets/icons/search2.svg',
                  color: selectedIndex == 2
                      ? const Color.fromARGB(255, 136, 12, 12)
                      : Colors.grey,
                ),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: SvgPicture.asset(
                  'assets/icons/receipt.svg',
                  color: selectedIndex == 3
                      ? const Color.fromARGB(255, 136, 12, 12)
                      : Colors.grey,
                ),
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: SvgPicture.asset(
                  'assets/icons/user (1).svg',
                  color: selectedIndex == 4
                      ? const Color.fromARGB(255, 136, 12, 12)
                      : Colors.grey,
                ),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
