import 'package:aftahrs/home/component/SearchField.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   title: const Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Row(
      //         children: [
      //           CircleAvatar(
      //             backgroundColor: Colors.black12,
      //             child: Icon(Icons.person, color: Colors.black),
      //           ),
      //           SizedBox(width: 10),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 "Lorem Ipsum",
      //                 style: TextStyle(
      //                     fontSize: 16,
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.black),
      //               ),
      //               Text(
      //                 "Lorem ipsum dolor sit",
      //                 style: TextStyle(fontSize: 8, color: Colors.black54),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text("North Kierland",
      //               style: TextStyle(fontSize: 10, color: Colors.black)),
      //           SizedBox(width: 5),
      //           Icon(Icons.location_on, color: Colors.black),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      // const SearchField(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '/Users/admin/Documents/aftahrs/aftahrs/assets/images/logo-aftahrs1.png',
              width: 100,
              height: 100,
            ),
            Text(
              "No pending orders",
              style: TextStyle(
                  color: const Color.fromARGB(255, 135, 37, 37),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Body',
                  fontSize: 20),
            ),
            Center(
              child: Text(
                "Your dont have any orders in progress.\n Browse restaurants near you",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(initialIndex: 1),
    );
  }
}
