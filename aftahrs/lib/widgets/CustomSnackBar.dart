import 'package:flutter/material.dart';

class CustomSnackBar {
  // Error SnackBar
  static showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: Colors.white), // Error icon
            SizedBox(width: 10), // Space between the icon and text
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.redAccent, // Error background color
        behavior: SnackBarBehavior.floating, // Floating SnackBar
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(20)), // Rounded corners
        ),
        elevation: 6, // Shadow effect
        // action: SnackBarAction(
        //   label: 'Retry', // Retry button label
        //   textColor: Colors.white,
        //   onPressed: () {
        //     // Retry logic, you can call your login again or any other action
        //     print('Retry clicked');
        //   },
        // ),
      ),
    );
  }

  // Success SnackBar
  static showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white), // Success icon
            SizedBox(width: 10), // Space between the icon and text
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green, // Success background color
        behavior: SnackBarBehavior.floating, // Floating SnackBar
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(20)), // Rounded corners
        ),
        elevation: 6, // Shadow effect
      ),
    );
  }
}
