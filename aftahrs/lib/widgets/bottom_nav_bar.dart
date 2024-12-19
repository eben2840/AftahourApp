import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;

  const CustomBottomNavigationBar({super.key, required this.selectedIndex});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _hoverIndex = -1;

  void _onEnter(int index) {
    setState(() {
      _hoverIndex = index;
    });
  }

  void _onExit() {
    setState(() {
      _hoverIndex = -1; // Reset the hover state when the mouse exits
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width -
          60, // Adjust the width to provide space for the border radius
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(20),
        ),
        // borderRadius: BorderRadius.circular(50),
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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/homepage');
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, '/orders');
            } else if (index == 2) {
              Navigator.pushReplacementNamed(context, '/search');
            } else if (index == 3) {
              Navigator.pushReplacementNamed(context, '/menu');
            }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background color for all items
          
          showUnselectedLabels: false, // Hide labels
          showSelectedLabels: false, // Hide labels
          items: [
            BottomNavigationBarItem(
              icon: MouseRegion(
                onEnter: (_) => _onEnter(0),
                onExit: (_) => _onExit(),
                child: Container(
                  
                  // padding: const EdgeInsets.all(5), // Space around the icon
                  child: Icon(
                    Icons.home_rounded,
                    color:
                        widget.selectedIndex == 0 ? const Color.fromARGB(255, 136, 12, 12) : Color.fromARGB(255, 235, 234, 234),
                    size: 26,
                  ),
                ),
              ),
              label: 'Home', // Empty label to comply with the required property
            ),
            BottomNavigationBarItem(
              icon: MouseRegion(
                onEnter: (_) => _onEnter(1),
                onExit: (_) => _onExit(),
                child: Container(
                  
                  // padding: const EdgeInsets.all(5),
                  child: Icon(
                    Icons.receipt,
                    color:
                        widget.selectedIndex == 1 ? const Color.fromARGB(255, 136, 12, 12): Color.fromARGB(255, 235, 234, 234),
                    size: 26,
                  ),
                ),
              ),
              label: 'Delivery', // Empty label to comply with the required property
            ),
            BottomNavigationBarItem(
              icon: MouseRegion(
                onEnter: (_) => _onEnter(2),
                onExit: (_) => _onExit(),
                child: Container(
                  
                  // padding: const EdgeInsets.all(5),
                  child: Icon(
                    Icons.search,
                    color:
                        widget.selectedIndex == 2 ? const Color.fromARGB(255, 136, 12, 12): Color.fromARGB(255, 235, 234, 234),
                    size: 26,
                  ),
                ),
              ),
              label: 'Search', // Empty label to comply with the required property
            ),
            BottomNavigationBarItem(
              icon: MouseRegion(
                onEnter: (_) => _onEnter(3),
                onExit: (_) => _onExit(),
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: widget.selectedIndex == 3
                  //       ? Colors.white
                  //       : (_hoverIndex == 3
                  //           ? Colors.grey[700]
                  //           : Colors.transparent),
                  //   borderRadius: BorderRadius.circular(50),
                  // ),
                  // padding: const EdgeInsets.all(5),
                  child: Icon(
                    Icons.person,
                    color:
                        widget.selectedIndex == 3 ? const Color.fromARGB(255, 136, 12, 12) : Color.fromARGB(255, 235, 234, 234),
                    size: 26,
                  ),
                ),
              ),
              label: 'Profile', // Empty label to comply with the required property
            ),
          ],
        ),
      ),
    );
  }
}
