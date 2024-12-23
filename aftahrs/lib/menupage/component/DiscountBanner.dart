import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 245, 202, 193),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Text.rich(
                TextSpan(
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  children: [
                    TextSpan(
                      text: "A Summer 20%\nSummer Surprise time  \n",
                      style: TextStyle(
                        fontFamily: 'Body',
                        fontSize: 18, // Adjusted font size for the first part
                      ),
                    ),
                    TextSpan(
                      text: "Cashback 20%",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Body',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.network(
              "assets/images/chicken-burger-with-flying-ingredients-hd-transparent-png-701751710853243v9zgwqwepn-removebg-preview.png",
              height: 150, // Adjusted image height
              width: 150, // Adjusted image width
              fit: BoxFit.cover, // Ensures the image is nicely scaled
            ),
          ],
        ));
  }
}
